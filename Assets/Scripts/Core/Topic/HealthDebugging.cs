using UnityEngine;

//Topics are also useful for debugging, as test classes can be
//added and removed without interfering with other code.
public class HealthDebugging : MonoBehaviour
{
    [SerializeField] private Health m_Health;

    //Sometime you want the difference between a value and what it previously 
    //was. This is demonstrated in this class with the use of a nullable value
    private float? m_PreviousHealth = null;

    private void Awake()
    {
        m_Health.CurrentHealth.Subscribe(LogHealth);
    }

    private void LogHealth(float currentHealth)
    {
        //Nullable value's Value property not to be confused with Topic's Value property
        string prevHealthString = m_PreviousHealth.HasValue ? m_PreviousHealth.Value.ToString() : "None";
        Debug.LogFormat("Health: Was {0} now {1}", prevHealthString, currentHealth);

        m_PreviousHealth = currentHealth;
    }
}
