using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


// gets all the suit resources, updates their UI bar,
// and exposes the values so gameplay systems can hook into them, like movement
public class SuitResourceManager : MonoBehaviour
{
    /// <summary>
    /// The list of all managed resources.
    /// </summary>
    [SerializeField] private List<SuitResource> suitResources;

    /// <summary>
    /// Initialize the resources at the start of the game.
    /// </summary>
    private void Start()
    {
        InitializeResources();
    }

    /// <summary>
    /// Initializes the resource values and subscriptions for UI updates.
    /// </summary>
    private void InitializeResources()
    {
        foreach (var resource in suitResources)
        {
            resource.ResourceValue.Value = resource.InitialValue;

            // Subscribe to value changes for UI update
            resource.ResourceValue.Subscribe(newValue =>
            {
                UpdateUIBar(resource.UiBar, newValue, resource.MaxValue);
            });

            //AddIntervalEffect(resource.Name, -1.0f, resource.MaxValue, Mathf.Infinity);

        }
    }

    /// <summary>
    /// Updates the UI bar for a given resource.
    /// </summary>
    /// <param name="uiBar">The fill bar UI component representing the resource.</param>
    /// <param name="value">The current value of the resource.</param>
    /// <param name="maxValue">The maximum value of the resource.</param>
    private void UpdateUIBar(Image uiBar, float value, float maxValue)
    {
        uiBar.fillAmount = value / maxValue;
    }

    /// <summary>
    /// Adds an drain (or gain) effect to a given resource.
    /// </summary>
    /// <param name="resourceName">The name of the resource to affect.</param>
    /// <param name="rate">The rate of change per second.</param>
    /// <param name="maxValue">The minimum/maximum value the resource can reach.</param>
    /// <param name="duration">The duration for which the effect should last in seconds.</param>
    public void AddIntervalEffect(string resourceName, float rate, float maxValue, float duration)
    {
        StartCoroutine(IntervalEffectCoroutine(resourceName, rate, maxValue, duration));
    }

    private IEnumerator IntervalEffectCoroutine(string resourceName, float rate, float maxValue, float duration)
    {
        float elapsed = 0;
        var resource = FindResourceByName(resourceName);
        if (resource == null)
        {
            Debug.LogWarning($"Resource {resourceName} not found.");
            yield break;
        }

        while (elapsed < duration)
        {
            elapsed += Time.deltaTime;
            // once the duration is over, clamp the value 0-1
            float newValue = Mathf.Clamp(resource.ResourceValue.Value + rate * Time.deltaTime, 0, maxValue);
            // if newValue = zero, end the effect
            if (newValue == 0)
            {
                yield break;
            }
            resource.ResourceValue.Value = newValue;
            yield return null;
        }
    }

    public SuitResource FindResourceByName(string resourceName)
    {
        return suitResources.Find(r => r.Name == resourceName);
    }
}

