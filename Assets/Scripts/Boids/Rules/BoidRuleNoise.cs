using UnityEngine;

public class BoidRuleNoise
{
    private float m_timeBetweenPoints;
    
    private Vector3 m_previousPoint;
    private Vector3 m_nextPoint;
    private float m_time;

    public BoidRuleNoise(float timeBetweenPoints)
    {
        m_timeBetweenPoints = timeBetweenPoints;
        m_previousPoint = Random.insideUnitSphere;
        m_nextPoint = Random.insideUnitSphere;
        m_time = 0f;
    }

    public Vector3 CalculateAcceleration(float time)
    {
        Vector3 acceleration = Vector3.Lerp(m_previousPoint, m_nextPoint, m_time / m_timeBetweenPoints);

        m_time += time;

        if (m_time >= m_timeBetweenPoints)
        {
            m_previousPoint = m_nextPoint;
            m_nextPoint = Random.insideUnitSphere;
            m_time = 0f;
        }

        return acceleration;
    }
}
