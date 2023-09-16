using UnityEngine;

public class Game : MonoBehaviour
{
    public class TimerTopic : Topic<float>
    {
        //The topic class allows for overrides on the Value
        //getter/setter. While it is advised that you don't 
        //override the getter, overriding the setter allows
        //you to restrict / modify the values as they are 
        //set on a topic. In this example, we limit the timer
        //to only allow positive values.
        public override float Value 
        { 
            set => base.Value = ClampTime(value); 
        }

        private float ClampTime(float value)
        {
            //The time cannot be less than zero
            return Mathf.Max(0f, value);
        }
    }

    public enum GameState
    {
        Begin,
        Running,
        Over
    }

    [SerializeField] private float m_TimeLimit;
    [SerializeField] private Health m_Health;

    public TimerTopic TimeRemaining { get; } = new TimerTopic();

    //While both the previous examples are floats, Topics can be
    //used for any primitive or class. Tracking changes to a player
    //model, a position, etc. can all be achieved using a Topic.
    public Topic<GameState> State { get; } = new Topic<GameState>();


    private void Awake()
    {
        TimeRemaining.Value = m_TimeLimit;
        State.Value = GameState.Begin;

        //We subscribe parameterlessly to UpdateGameOver, so that
        //we can use the same function for two different topics.
        //The topics value can be accessed from the topic directly.
        TimeRemaining.Subscribe(UpdateGameOver);
        m_Health.CurrentHealth.Subscribe(UpdateGameOver);
    }

    private void Update()
    {
        if (State.Value == GameState.Running)
        {
            TimeRemaining.Value -= Time.deltaTime;
        }
    }

    public void StartGame()
    {
        State.Value = GameState.Running;
    }

    public void EndGame()
    {
        State.Value = GameState.Over;
    }

    //UpdateGameOver is subscribed to two topics (TimeRemaining,
    //CurrentHealth) and publishes to a third (State). Topics can
    //be combined in any way. Restricting the complexity of the
    //call stack is an exercise left to the engineer.
    private void UpdateGameOver()
    {
        //The topics value are accessed from the topic directly.
        //The Game will stop if it's started and either when the
        //time remaining runs out or the player runs out of health.
        bool willEndGame = State.Value == GameState.Running && (TimeRemaining.Value <= 0 || m_Health.CurrentHealth.Value <= 0);

        if (willEndGame)
        {
            EndGame();
        }
    }
}
