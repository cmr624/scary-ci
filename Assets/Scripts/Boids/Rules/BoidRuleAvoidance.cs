using System.Collections.Generic;
using UnityEngine;

namespace Winch.Boids
{
    public class BoidRuleAvoidance
    {
        public Vector3 CalculateAcceleration(Vector3 currentPosition, float range, IEnumerable<Vector3> targetsPositions)
        {
            if(range <= 0)
            {
                return Vector3.zero;
            }

            Vector3 acceleration = Vector3.zero;

            foreach (Vector3 target in targetsPositions)
            {
                Vector3 relativePosition = target - currentPosition;

                //Calculate how strong the avoidance force is
                //The closer the target, the stronger the force
                //If outside of range, will be zero
                float magnitude = 1 - Mathf.Clamp01(relativePosition.magnitude / range);

                acceleration += -relativePosition.normalized * magnitude;
            }

            return acceleration;
        }
    }
}
