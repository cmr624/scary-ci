using UnityEngine;
using UnityEngine.UI;

public class asyncExample : MonoBehaviour
{
    public Playback p;
    public Text infoText;
    public Button loadButton;
    public Image progressBar;

    bool loading;
    float progress = 0f;

    void Awake()
    {
        progressBar.fillAmount = 0f;
    }

    void Update()
    {
        // to get the progress we can get the index of the currently loaded frame divided by total number of textures
        progress = (float)p.AsyncIndex / p.resourceFiles.Count;
        progressBar.fillAmount = progress;
    }

    public void OnLoadButtonClicked()
    {
        // first we subribe to the loaded event that is called after the async loading has completed
        p.loadedCallback = new PlaybackAsyncCallback(OnSequenceLoaded);

        p.LoadSequenceAsync(ref p.resourceFiles, true);
        loadButton.interactable = false;
        infoText.text = "The sequence is loading";
    }

    // this will be called after the loading has finished
    public void OnSequenceLoaded()
    {
        infoText.text = "The sequence has been loaded";
    }
}