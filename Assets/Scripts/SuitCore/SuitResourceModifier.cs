using System;
using System.Collections;
using System.Collections.Generic;
using Unity.FPS.Gameplay;
using UnityEngine;

[RequireComponent(typeof(PlayerCharacterController))]
public class SuitResourceModifier : MonoBehaviour
{
   [SerializeField] private SuitResourceManager suitResourceManager;
   
   [SerializeField]
   [Tooltip("Animation curve to map the Agility resource value to a speed multiplier. X-axis is the resource value (0 to 1), Y-axis is the speed multiplier.")]
   private AnimationCurve agilityCurve;// = new AnimationCurve(new Keyframe(0f, 1f), new Keyframe(1f, 5f));
   
   private PlayerCharacterController playerCharacterController;
   // agility: affect agilitySpeedModifier in PlayerCharacterController
   private SuitResource agilityResource;
   private SuitResource oxygenResource;
   
   [Header("Breath Holding")]
   public AnimationCurve oxygenDepletionCurve;// = new AnimationCurve(new Keyframe(0f, 1f), new Keyframe(1f, 9f));
   private float breathHoldStartTime;
   
   [SerializeField] private float GlobalOxygenDecayRate = -1.0f;
   
   private PlayerInputHandler playerInputHandler;
   private void Start()
   {
       playerInputHandler = GetComponent<PlayerInputHandler>();
       playerCharacterController = GetComponent<PlayerCharacterController>(); 
       agilityResource = suitResourceManager.FindResourceByName("Agility");
       oxygenResource = suitResourceManager.FindResourceByName("Oxygen");
       oxygenDepletionCurve = new AnimationCurve(new Keyframe(0f, 1f), new Keyframe(1f, 9f));

       if(agilityResource != null)
       {
           // Subscribe to agility resource changes
           agilityResource.ResourceValue.Subscribe(UpdateAgility);
           // also use global oxygen decay rate for agility
           suitResourceManager.AddIntervalEffect(agilityResource.Name, GlobalOxygenDecayRate * 2, agilityResource.MaxValue, Mathf.Infinity);
       }
       
       if (oxygenResource!=null)
       {
           //add a global gameplay decay effect to oxygen
           suitResourceManager.AddIntervalEffect(oxygenResource.Name, GlobalOxygenDecayRate, oxygenResource.MaxValue, Mathf.Infinity);
       }

   }


   private void Update()
   {
       UpdateOxygenLevel();
   }



   private void UpdateAgility(float newAgilityValue)
   {
       // normalize the agility value to 0-1
       float normalizedAgility = newAgilityValue / agilityResource.MaxValue;
       // Use animation curve to get the new speed multiplier
       float newAgilitySpeedMultiplier = agilityCurve.Evaluate(normalizedAgility);
       // Update the speed multiplier in PlayerCharacterController
       playerCharacterController.AgilitySpeedMultiplier = newAgilitySpeedMultiplier;
   }

   // oxygen: affect weapon sway in PlayerWeaponsManager
   // create a modifier based on the oxygen resource that affects weapon sway, the less oxygen you have, the more sway
   // or, tbd, based on direction
   private void UpdateOxygenLevel()
   {
       if (playerInputHandler.GetHoldBreathInputHeld())
       {
           float elapsedTime = Time.time - breathHoldStartTime;
           float depletionRate = oxygenDepletionCurve.Evaluate(elapsedTime);
           float newOxygenValue = oxygenResource.ResourceValue.Value - (depletionRate * Time.deltaTime);
           oxygenResource.ResourceValue.Value = Mathf.Max(0f, newOxygenValue);
       }
   }

}
