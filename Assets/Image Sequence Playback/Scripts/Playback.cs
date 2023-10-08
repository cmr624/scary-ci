using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class Playback : MonoBehaviour 
{
    public string resourceFolder;
    public string sequenceFolder;
    public float FPS = 25;
    public bool loadOnAwake = true;
    public bool playOnAwake = true;
    public bool loop;
    public PlaybackMode mode;
    public Material playbackMat;
    public RawImage rawImage;
    public float startDelay;
    public bool asyncLoading;
    public List<string> resourceFiles = new List<string>();
    public PlaybackAsyncCallback loadedCallback;
    Texture2D[] sequence;
    Texture2D current;
    
    int index = 0;
    bool isPlaying;
    bool isPaused;

    bool isLoadingAsync;
    bool playAfterAsync;
    int asyncIndex;
    List<string> asyncFiles;
    ResourceRequest currentRequest = null;

    // lists for multiple outputs
    public bool multiOut;
    public List<RawImage> uiOutList;
    public List<Material> matOutList;

    public bool IsPlaying
    {
        get
        {
            return isPlaying;
        }
    }
    public bool IsPaused
    {
        get
        {
            return isPaused;
        }
    }
    public bool IsLoadingAsync
    {
        get
        {
            return isLoadingAsync;
        }
    }
    /// <summary>
    /// The index of the item that is currently being loaded from the list
    /// </summary>
    public int AsyncIndex
    {
        get
        {
            return asyncIndex;
        }
    }

    public bool playAudio;
    public AudioSource source;
    public AudioClip clip;
    public float clipBaseFps = 25;

    /// <summary>
    /// Progress of playback ranging from 0 to 1.
    /// </summary>
    public float progress
    {
        get
        {
            if (sequence != null)
                return (float)index / (sequence.Length - 1f);
            else return 0;
        }
    }
    /// <summary>
    /// Total number of frames.
    /// </summary>
    public int frames
    {
        get
        {
            if (sequence != null)
                return sequence.Length;
            else return 0;
        }
    }
    /// <summary>
    /// The index of the current displayed frame (starting from 0).
    /// </summary>
    public int currentFrame
    {
        get
        {
            return index;
        }
    }
    public bool showDebug;

    void Awake()
    {
        if (!loadOnAwake)
            return;

        if (!asyncLoading)
            LoadSequence(sequenceFolder, playOnAwake);
        else LoadSequenceAsync(ref resourceFiles, playOnAwake);
    }

    [SerializeField]
    //float time = 0;
    float frame = 0;
    //int lastIndex = 0;
    //int framesPlayed = 0;
    float delta = 0;
    void Update()
    {
        if (isLoadingAsync)
        {
            if (asyncIndex == asyncFiles.Count) // sequence has finished loading
            {
                OnAsyncLoadEnd();
                return;
            }
            if (currentRequest == null) // asset needs to be loaded
            {
                currentRequest = Resources.LoadAsync<Texture2D>(asyncFiles[asyncIndex]);
                return;
            } else
            {
                if (currentRequest.isDone) // current asset has been loaded
                {
                    sequence[asyncIndex] = currentRequest.asset as Texture2D;
                    currentRequest = null;
                    asyncIndex++;
                }
            }
        }

        if (isPlaying)
        {
            //time += Time.deltaTime;

            delta += Time.deltaTime;

            /*if (time >= 1f / FPS)
            {
                time -= (1f / FPS);
                PlayBack();
                framesPlayed++;
            }*/

            frame = delta / (1f / FPS);
            index = Mathf.Clamp(Mathf.FloorToInt(frame), 0, sequence.Length); // clamp because delta can be < 0 if you call Play(delay)

            /*if (lastIndex != index) test FPS
            {
                lastIndex = index;
                Debug.Log("Index= " + index + " FPS=" + (framesPlayed / Time.time));
            }*/
            PlayBack();
        }
    }

    void PlayBack()
    {
        if (isPlaying)
        {
            if (sequence != null)
            {
                if (sequence.Length > 0)
                {
                    //UpdateFrame();
                    if (playAudio) source.pitch = FPS / clipBaseFps;
                    //index++;
                    if (index >= sequence.Length)
                    {
                        if (loop)
                        {
                            delta = 0;
                            index = 0;
                            if (playAudio)
                            {
                                source.Stop();
                                source.Play();
                            }
                            return;
                        }
                        else
                        {
                            index = 0;
                            delta = 0;
                            isPlaying = false;
                            return;
                        }
                    }
                    UpdateFrame();
                }
            }
        }
    }

    void UpdateFrame()
    {
        if (mode == PlaybackMode.Material && !multiOut)
        {
            playbackMat.mainTexture = sequence[index];
        }
        else if (mode == PlaybackMode.LegacyGUI)
        {
            current = sequence[index];
        }
        else if (mode == PlaybackMode.uGUI && !multiOut)
        {
            rawImage.texture = sequence[index];
        } else if (mode == PlaybackMode.Material && multiOut)
        {
            for (int i = 0; i < matOutList.Count; i++)
            {
                matOutList[i].mainTexture = sequence[index];
            }
        } else if (mode == PlaybackMode.uGUI && multiOut)
        {
            for (int i = 0; i < uiOutList.Count; i++)
            {
                uiOutList[i].texture = sequence[index];
            }
        }
    }

    public void Play()
    {
        Play(0);
    }
    public void Play(float delay)
    {
        if (isLoadingAsync)
            return;

        if (playAudio)
        {
            if (!source || !clip) Debug.LogError("Playback: AudioSource or AudioClip is null!");
        }

        if (!isPlaying)
        {
            index = 0;
            isPlaying = true;
            //time = (1f/FPS) - delay;
            delta -= delay;
        }
        else if (isPaused)
        {
            isPaused = false;
            isPlaying = true;
            //time = (1f / FPS) - delay;
        }
        if (playAudio)
        {
            if (source.clip != clip) source.clip = clip;
            source.pitch = FPS / clipBaseFps;
            source.PlayDelayed(delay);
        }
    }

    public void Pause(bool value)
    {
        isPaused = value;
        isPlaying = !value;
        if (value)
        {
            if (playAudio)
            source.Pause();
        }
        else
        {
            //time = 1f / FPS;
            if (playAudio)
            source.Play();
        }
    }

    public void Stop()
    {
        isPlaying = false;
        isPaused = false;
        index = 0;
        if (playAudio) source.Stop();
    }
    /// <summary>
    /// If clear = true and Playback is in uGUI mode, it will also clear the texture from the RawImage.
    /// </summary>
    public void Stop(bool clear)
    {
        isPlaying = false;
        isPaused = false;
        index = 0;
        if (playAudio) source.Stop();
        if (mode == PlaybackMode.uGUI && clear) rawImage.texture = null;
    }

    public void LoadSequence(string resourceFolder, bool play = false)
    {
        Object[] obj = Resources.LoadAll(resourceFolder, typeof(Texture2D));
        if (obj.Length > 0)
        {
            sequence = new Texture2D[obj.Length];
            for (int i = 0; i < obj.Length; i++)
            {
                sequence[i] = (Texture2D)obj[i];
            }
            index = 0;
            UpdateFrame();
            if (play) Play(startDelay);
        }
        else Debug.LogError("Playback: Can't find sequence folder, it needs to be in 'Resources' folder");
    }
    public void LoadSequence(Texture2D[] textures,bool play = false)
    {
        if (textures != null)
        {
            sequence = textures;
            if (play) Play();
        }
    }

    /// <summary>
    /// Loads the sequence set up in the inspector asynchroniously.
    /// </summary>
    public void LoadSequenceAsync(bool play = false)
    {
        LoadSequenceAsync(ref resourceFiles, play);
    }
    /// <summary>
    /// Load a list of textures asynchroniously.
    /// </summary>
    /// <param name="resourcePaths">The resource paths to the files</param>
    /// <param name="play">Play after loading?</param>
    public void LoadSequenceAsync(ref List<string> resourcePaths, bool play = false)
    {
        if (resourcePaths.Count == 0)
            return;
        playAfterAsync = play;
        isLoadingAsync = true;
        asyncIndex = 0;
        asyncFiles = resourcePaths;
        sequence = new Texture2D[resourcePaths.Count];
    }

    void OnAsyncLoadEnd()
    {
        isLoadingAsync = false;
        currentRequest = null;
        if (loadedCallback != null)
            loadedCallback();
        if (playAfterAsync)
            Play();
    }

    /// <summary>
    /// Reset the sequence array.
    /// </summary>
    public void Clear()
    {
        Stop();
        sequence = new Texture2D[0];
        if (mode == PlaybackMode.uGUI) rawImage.texture = null;
    }

    /// <summary>
    /// Get the texture that should be displayed right now.
    /// </summary>
    public Texture2D GetTexture()
    {
        return current;
    }
}

public enum PlaybackMode { Material = 0, LegacyGUI = 1, uGUI = 2 }

public delegate void PlaybackAsyncCallback();