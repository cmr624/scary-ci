using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PortalDoor : MonoBehaviour
{
   
   [SerializeField] private string _sceneName="SampleScene";

   private void OnTriggerEnter(Collider other)
   {
       // on trigger collide, if the tag of the object is Player, then load the scene from the string specified
         if (other.CompareTag("Player"))
         {
            LoadScene();
         }
   }
   
    private void LoadScene()
    {
        SceneManager.LoadScene(_sceneName);
    }
}
