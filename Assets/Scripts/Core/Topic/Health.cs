using UnityEngine;

public class Health : MonoBehaviour
{
    [SerializeField] private float m_StartingHealth;
    [SerializeField] private float m_MaxHealth;

    //We declare and initialise the topic. This is important to do
    //before Awake so other classes referencing this class don't 
    //get null references when subscribing to a topic on start up.
    public Topic<float> CurrentHealth { get; } = new Topic<float>();

    //We won't use a Topic for max health, as it won't change over
    //the course of our program. If a value will change, however, 
    //you should consider making it a topic, especially if multiple
    //classes might edit the value.
    public float MaxHealth => m_MaxHealth;

    public void Awake()
    {
        //We can assign a starting value in Awake.
        CurrentHealth.Value = m_StartingHealth;

        //Topics hare also useful for avoiding race conditions / script execution
        //order bugs on start up. If a Subscriber subscribes to the topic before the
        //initial value is set, it will get a default value. Then it will be
        //updated with the correct starting value once this script is called, before
        //the first frame. Without topics, dependent scripts sometimes need to be
        //placed in a delicate order such that they have the correct values on
        //initialisation.
    }

    public void TakeDamage(float damageAmount)
    {
        //Publish a new value to the topic by setting the Value property
        //(This function is actually a poltergeist, since CurrentHealth
        //is a public property and could be comfortably set from another
        //class without calling a method. Please forgive it for the sake
        //of example!)
        CurrentHealth.Value -= damageAmount;
    }
}
