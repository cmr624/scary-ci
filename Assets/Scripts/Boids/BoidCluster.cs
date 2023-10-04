using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Winch.Boids
{
    public class BoidCluster : MonoBehaviour
    {
        public Vector3 Boundaries;
        public float BoundaryForce = 1f;
        [Header("Boid Info")]
        public float SpeedLimit = 1f;
        public float AvoidanceRange = 1f;
        public int VisionNumber = 5;
        public float AvoidanceWeight = 1f;
        public float AlignmentWeight = 1f;
        public float CohensionWeight = 1f;
        public float NoiseWeight = 1f;
        public float NoiseChangeTime = 1f;
        [Header("Target")]
        public Transform Target;
        public float SeekWeight = 1f;
        [Header("Debugging")]
        public bool DrawAccelerationRays;

        private List<Boid> m_boids = new();

        private BoidRuleAlignment m_alignment = new();
        private BoidRuleAvoidance m_avoidance = new();
        private BoidRuleCohesion m_cohesion = new();
        private BoidRuleBoundary m_boundary = new();
        private BoidRuleSeek m_seek = new();

        private Dictionary<Boid, BoidRuleNoise> m_noises = new();

        public Boid Add(Vector3 startingPosition, Vector3 startingVelocity)
        {
            Boid boid = new();

            boid.Position.Value = startingPosition;
            boid.Velocity.Value = startingVelocity;

            m_boids.Add(boid);

            m_noises[boid] = new BoidRuleNoise(NoiseChangeTime);

            return boid;
        }

        public void Remove(Boid boid)
        {
            m_boids.Remove(boid);
            m_noises.Remove(boid);
        }

        public void UpdateCluster(float time)
        {
            foreach (Boid boid in m_boids)
            {
                IEnumerable<Boid> seenBoids = m_boids
                    .OrderBy(b => (b.Position.Value - boid.Position.Value).sqrMagnitude)
                    //The closest boid will be itself, which we don't want included in the list
                    .Skip(1)
                    .Take(VisionNumber);

                Vector3 alignmentAcceleration = AlignmentWeight * m_alignment.CalculateAcceleration(boid.Velocity.Value, seenBoids.Select(b => b.Velocity.Value));
                Vector3 avoidanceAcceleration = AvoidanceWeight * m_avoidance.CalculateAcceleration(boid.Position.Value, AvoidanceRange, seenBoids.Select(b => b.Position.Value));
                Vector3 cohesionAcceleration  = CohensionWeight * m_cohesion.CalculateAcceleration(boid.Position.Value, seenBoids.Select(b => b.Position.Value));
                Vector3 boundaryAcceleration  = BoundaryForce   * m_boundary.CalculateAcceleration(boid.Position.Value, Boundaries);
                Vector3 noiseAcceleration     = NoiseWeight     * m_noises[boid].CalculateAcceleration(time);

                if (DrawAccelerationRays)
                {
                    Debug.DrawRay(boid.Position.Value, alignmentAcceleration, Color.red);
                    Debug.DrawRay(boid.Position.Value, avoidanceAcceleration, Color.blue);
                    Debug.DrawRay(boid.Position.Value, cohesionAcceleration, Color.green);
                    Debug.DrawRay(boid.Position.Value, boundaryAcceleration, Color.yellow);
                    Debug.DrawRay(boid.Position.Value, noiseAcceleration, Color.magenta);
                }

                Vector3 acceleration =
                    alignmentAcceleration +
                    avoidanceAcceleration +
                    cohesionAcceleration +
                    boundaryAcceleration +
                    noiseAcceleration;

                if (Target != null)
                {
                    Vector3 targetLocalPosition = transform.InverseTransformPoint(Target.position);

                    Vector3 seekAcceleration = SeekWeight * m_seek.CalculateAcceleration(boid.Position.Value, targetLocalPosition);

                    if (DrawAccelerationRays)
                    {
                        Debug.DrawRay(boid.Position.Value, seekAcceleration, Color.cyan);
                    }

                    acceleration += seekAcceleration;
                }

                boid.Acceleration.Value = acceleration;
                boid.Update(time);
            }
        }
    }
}
