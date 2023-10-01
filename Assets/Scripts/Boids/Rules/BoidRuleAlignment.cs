using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Winch.Boids
{
    public class BoidRuleAlignment
    {
        public Vector3 CalculateAcceleration(Vector3 currentVelocity, IEnumerable<Vector3> targetsVelocities)
        {
            if (targetsVelocities.Count() > 0)
            {
                return targetsVelocities.Average() - currentVelocity;
            }

            return Vector3.zero;
        }
    }
}
