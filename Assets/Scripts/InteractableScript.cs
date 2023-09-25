using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// This script is for all things interactable. Primarily has the following responsibilities:
// 1) Tells DialogueManager what should pop up in the dialogue UI if the user chooses to interact 
// 2) (TODO) pops up a canvas UI in the environment to tell the user what the item is, or what button to click to interact (i.e. "Ammo" or "Press B")

namespace Unity.FPS.Gameplay
{
    public class InteractableScript : MonoBehaviour
    {
        [SerializeField]
        bool m_hasTextToDisplay;

        [SerializeField]
        string m_textToDisplay;

        DialogueManager m_dialogueManager;
        
        

        // Start is called before the first frame update
        void Start()
        {
            m_dialogueManager = GameObject.Find("DialogueManager").GetComponent<DialogueManager>();
        }

        void OnTriggerEnter(Collider other)
        {
            PlayerCharacterController pickingPlayer = other.GetComponent<PlayerCharacterController>();

            if (pickingPlayer != null)
            {
                m_dialogueManager.SetDialogueInteractable(m_textToDisplay);
            }
        }

        private void OnTriggerExit(Collider other)
        {
            PlayerCharacterController pickingPlayer = other.GetComponent<PlayerCharacterController>();

            if (pickingPlayer != null)
            {
                m_dialogueManager.UnsetDialogueInteractable();
            }
        }
    }
}
