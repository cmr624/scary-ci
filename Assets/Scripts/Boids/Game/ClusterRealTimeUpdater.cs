using UnityEngine;

namespace Winch.Boids
{
    public class ClusterRealTimeUpdater : MonoBehaviour
    {
        [SerializeField]
        private BoidCluster m_cluster;
        [SerializeField]
        private float m_scalar = 1f;

        private void Update()
        {
            m_cluster.UpdateCluster(Time.deltaTime * m_scalar);
        }
    }
}
