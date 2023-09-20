using System.Collections;
using System.Collections.Generic;
using Unity.FPS.Gameplay;
using UnityEngine;
using UnityEngine.Serialization;

public class ResourcePickup : Pickup
{
    [Header("Parameters")]
    [Tooltip("Name of the resource to affect on pickup")]
    public string ResourceName;

    [Tooltip("Amount to add to the resource on pickup")]
    public float AddAmount;
    
    [FormerlySerializedAs("ResourceManager")] public SuitResourceManager suitResourceManager;

    protected override void OnPicked(PlayerCharacterController player)
    {
        if (suitResourceManager)
        {
            var resource = suitResourceManager.FindResourceByName(ResourceName);

            if (resource != null)
            {
                float newValue = Mathf.Clamp(resource.ResourceValue.Value + AddAmount, 0, resource.MaxValue);
                resource.ResourceValue.Value = newValue;

                PlayPickupFeedback();
                Destroy(gameObject);
            }
            else
            {
                Debug.LogWarning($"Resource {ResourceName} not found.");
            }
        }
        else
        {
            Debug.LogWarning("SuitResourceManager not found on player.");
        }
    }
}
