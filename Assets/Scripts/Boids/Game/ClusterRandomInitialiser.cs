using UnityEngine;

namespace Winch.Boids
{
    internal class ClusterRandomInitialiser : MonoBehaviour
    {
        [SerializeField]
        private int m_numBoids;
        [SerializeField]
        private bool m_useSeed;
        [SerializeField]
        private int m_seed;
        [SerializeField]
        private Vector3 m_minPosition;
        [SerializeField]
        private Vector3 m_maxPosition;
        [SerializeField]
        private float m_minStartingSpeed;
        [SerializeField]
        private float m_maxStartingSpeed;
        [SerializeField]
        private BoidCluster m_cluster;

        private void Start()
        {
            if (m_useSeed)
            {
                Random.InitState(m_seed);
            }

            for (int i = 0; i < m_numBoids; i++)
            {
                Vector3 startingPosition = new()
                {
                    x = Mathf.Lerp(m_minPosition.x, m_maxPosition.x, Random.value),
                    y = Mathf.Lerp(m_minPosition.y, m_maxPosition.y, Random.value),
                    z = Mathf.Lerp(m_minPosition.z, m_maxPosition.z, Random.value),
                };

                float speed = Mathf.Lerp(m_minStartingSpeed, m_maxStartingSpeed, Random.value);
                Vector3 startingVelocity = speed * Random.insideUnitSphere;

                Boid boid = m_cluster.Add(startingPosition, startingVelocity);
            }
        }       
    }
}
