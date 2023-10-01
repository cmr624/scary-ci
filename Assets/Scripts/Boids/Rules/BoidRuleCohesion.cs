using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Winch.Boids
{
    public class BoidRuleCohesion
    {
        public Vector3 CalculateAcceleration(Vector3 currentPosition, IEnumerable<Vector3> targetsPositions)
        {
            if (targetsPositions.Count() > 0)
            {
                return targetsPositions.Average() - currentPosition;
            }

            return Vector3.zero;
        }
    }
}
