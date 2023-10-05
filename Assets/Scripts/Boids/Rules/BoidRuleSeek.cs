using UnityEngine;

public class BoidRuleSeek
{
    public Vector3 CalculateAcceleration(Vector3 position, Vector3 targetPosition)
    {
        return (targetPosition - position).normalized;
    }
}
