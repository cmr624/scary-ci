using System;
using UnityEngine;
using Unity.FPS.Game;
using TMPro;
using System.Collections;

namespace Unity.FPS.Gameplay {

    public class DialogueManager : MonoBehaviour
    {

        PlayerInputHandler m_InputHandler;
        string m_dialogue;
        bool m_interactable;
        bool m_dialogueIsDisplayed;
        GameObject m_player;
        TMP_Text m_dialogueTextMeshPro;
        bool m_dialogueDone;
        


        void Start()
        {
            m_player = GameObject.Find("ScaryPlayer");
            m_InputHandler = m_player.GetComponent<PlayerInputHandler>();
            DebugUtility.HandleErrorIfNullGetComponent<PlayerInputHandler, DialogueManager>(m_InputHandler,
                this, gameObject);
            m_dialogueTextMeshPro = GetComponentInChildren<TMP_Text>(true);
            DebugUtility.HandleErrorIfNullGetComponent<TextMeshPro, DialogueManager>(m_dialogueTextMeshPro,
                this, gameObject);

            m_dialogueTextMeshPro.enabled = false;
            m_dialogueDone = false;
        }

        void Update()
        {
            if (shouldDisplayDialogue())
            {
                m_dialogueTextMeshPro.text = m_dialogue;
                m_dialogueTextMeshPro.enabled = true;
                m_dialogueIsDisplayed = true;
            }
            else {
                m_dialogueTextMeshPro.enabled = false;
                m_dialogueIsDisplayed = false;
            }

            if (m_dialogueIsDisplayed)
            {
                StartCoroutine("timeoutDialogue");
            }
            else {
                StopCoroutine("timeoutDialogue");
            }
        }

        private IEnumerator timeoutDialogue() {
            while (true)
            {
                yield return new WaitForSeconds(10);
                m_dialogueTextMeshPro.enabled = false;
                m_dialogueIsDisplayed = false;
            }
        }

        // when player gets close to an NPC with dialogue or object with text, that object can set our dialogue to display next
        public void SetDialogueInteractable(string pDialogue){
            m_dialogue = pDialogue;
            m_interactable = true;
        }

        // when we get out of range of an NPC or object with dialogue / text
        public void UnsetDialogueInteractable() {
            m_interactable = false;
        }

        private bool shouldDisplayDialogue()
        {
            if (m_InputHandler.GetInteractButtonDown()) {
                m_dialogueDone = false;
                if (m_interactable)
                {
                    return true; // we are in range of an interactable object
                }
                else {
                    return false;
                }
            }

            return m_dialogueIsDisplayed;
        }
    }
}
