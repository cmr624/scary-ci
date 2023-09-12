using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainLoader : MonoBehaviour
{
    [SerializeField] private bool _isLoaderScene = false;
    [SerializeField] private string _sceneName="SampleScene";
    [SerializeField] private float _loadTime=2f;
    // Start is called before the first frame update
    void Start()
    {
        // invoke loadscene after set amount of time
        if (_isLoaderScene)
        {
            Invoke(nameof(LoadScene), _loadTime);
        }
        
    }

    private void LoadScene()
    {
        SceneManager.LoadScene(_sceneName); 
    }

    public void LoadScene(string name)
    {
        SceneManager.LoadScene(name); 
    }
}
