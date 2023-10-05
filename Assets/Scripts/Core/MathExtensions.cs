using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public static class MathExtensions
{
    public static Vector3 Average(this IEnumerable<Vector3> vectors)
    {
        if (vectors.Count() > 0)
        {
            Vector3 sum = Vector3.zero;

            foreach (Vector3 v in vectors)
            {
                sum += v;
            }

            return sum / vectors.Count();
        }

        return Vector3.zero;
    }
}
