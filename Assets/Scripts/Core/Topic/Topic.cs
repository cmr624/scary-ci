using System;

/// <summary>
/// A topic allows for subscribers to watch a value as it changes and publishers
/// to change a value without being concerned who is watching. In other words, they
/// decouple the production of information from its consumption. Topics can have 
/// any number of publishers and any number of subscribers.
/// </summary>
public class Topic<T>
{
    private T m_Value;
    private Action<T> m_OnValueChanged;
    private Action m_OnValueChangedParameterless;

    public virtual T Value
    {
        get => m_Value;
        set
        {
            //Topics are not updated when the value they are set to is 
            //the same as its current value.
            if (Equals(m_Value, value) == false)
            {
                m_Value = value;
                m_OnValueChanged?.Invoke(m_Value);
                m_OnValueChangedParameterless?.Invoke();
            }
        }
    }

    public Topic() : this(default) { }

    public Topic(T startingValue)
    {
        m_Value = startingValue;
    }

    //When a value subscribes to a topic, it is called immediately
    //with the topics current value. This brings the subscriber 
    //into line with the current value. No need to call a separate
    //update or refresh function.
    //---
    //It is best practice to subscribe to topics with idempotent functions.
    //Idempotence is when performing a function any number of times does not 
    //change the output for a given input.
    public void Subscribe(Action<T> action)
    {
        action?.Invoke(m_Value);
        m_OnValueChanged += action;
    }

    public void Unsubscribe(Action<T> action)
    {
        m_OnValueChanged -= action;
    }

    //You can subcribe parameterlessly when you need to know the value has changed
    //without knowing the precise value
    public void Subscribe(Action action)
    {
        action?.Invoke();
        m_OnValueChangedParameterless += action;
    }

    public void Unsubscribe(Action action)
    {
        m_OnValueChangedParameterless -= action;
    }
}
