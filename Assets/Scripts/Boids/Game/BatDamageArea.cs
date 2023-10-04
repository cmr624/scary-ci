using Unity.FPS.Game;
using UnityEngine;

public class BatDamageArea : MonoBehaviour
{
    public Damageable Target;

    [SerializeField]
    private float m_damage;
    [SerializeField]
    private float m_range;
    [SerializeField]
    private float m_chargeTime;

    private float m_charge;

    private void Start()
    {
        //Give initial random value so the cluster doesn't all fire at once
        m_charge = Random.value * m_chargeTime;
    }

    private void Update()
    {
        if(Target == null)
        {
            return;
        }

        float distance = Vector3.Distance(transform.position, Target.transform.position);

        if (distance > m_range)
        {
            return;
        }
        
        //Only charge when in range
        m_charge += Time.deltaTime;

        if (m_charge < m_chargeTime)
        {
            return;
        }

        m_charge = 0f;

        Target.InflictDamage(m_damage, isExplosionDamage: false, gameObject);
    }
}
