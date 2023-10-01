using UnityEngine;

namespace Winch.Boids
{
    public class BoidRuleBoundary
    {
        public Vector3 CalculateAcceleration(Vector3 currentPosition, Vector3 boundaries)
        {
            return ApplyDimensionForce(currentPosition.x, boundaries.x, Vector3.right)
                + ApplyDimensionForce(currentPosition.y, boundaries.y, Vector3.up)
                + ApplyDimensionForce(currentPosition.z, boundaries.z, Vector3.forward);
        }

        private Vector3 ApplyDimensionForce(float position, float boundary, Vector3 dimension)
        {
            Vector3 acceleration = Vector3.zero;

            if (position > boundary)
            {
                acceleration += (boundary - position) * dimension;
            }

            if (position < 0)
            {
                acceleration += (- position) * dimension;
            }

            return acceleration;
        }
    }
}
