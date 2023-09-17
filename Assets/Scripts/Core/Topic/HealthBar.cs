using UnityEngine;
using UnityEngine.UI;

public class HealthBar : MonoBehaviour
{
    [SerializeField] private Health m_Health;
    [SerializeField] private Slider m_Slider;

    private void Start()
    {
        //Thanks to topics, wherever the Health value is set from
        //anywhere across the project, the healthbar will always
        //be updated. The need to update the healthbar has been
        //abstracted away.
        m_Health.CurrentHealth.Subscribe(SetHealthBarValue);

        //Using anonamous functions is normally not good practice for
        //Topics, as they cannot be Unsubscribed.
        m_Health.CurrentHealth.Subscribe(value => Debug.Log(value));
    }

    private void OnDestroy()
    {
        //It's normally a good idea to unsubscribe OnDestroy to 
        //avoid null / missing refs.
        m_Health.CurrentHealth.Unsubscribe(SetHealthBarValue);
    }

    //Will be called on subscribe and then every time Health changes.
    //The value of the slider and health will never be out of sync.
    private void SetHealthBarValue(float currentHeath)
    {
        m_Slider.value = currentHeath / m_Health.MaxHealth;
    }
}
