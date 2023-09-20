using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Represents a suit resource, like agility or oxygen.
/// It has an initial and maximum value, and a UI bar that represents the current value.
/// also stores the topic for the current value, so other systems can hook into it.
/// </summary>
[System.Serializable]
public class SuitResource
{
    /// <summary>
    /// The name of the resource.
    /// </summary>
    public string Name;

    /// <summary>
    /// The initial value of the resource.
    /// </summary>
    public float InitialValue;

    /// <summary>
    /// The maximum value the resource can have. 
    /// </summary>
    public float MaxValue = 100.0f;

    /// <summary>
    /// The UI bar that represents the resource value.
    /// </summary>
    public Image UiBar;

    /// <summary>
    /// The Topic representing the value of the resource.
    /// </summary>
    [HideInInspector] public Topic<float> ResourceValue;

    /// <summary>
    /// Constructor initializes the Topic.
    /// </summary>
    public SuitResource()
    {
        ResourceValue = new Topic<float>();
    }
}