using UnityEngine;

public class RandomiseAnimationStart : MonoBehaviour
{
    [SerializeField]
    private Animator m_animator;
    [SerializeField]
    private string m_startingAnimationName;

    void Start()
    {
        m_animator.Play(m_startingAnimationName, -1, Random.value);
    }
}
