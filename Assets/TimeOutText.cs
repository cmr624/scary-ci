using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class TimeOutText : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        // start coroutine that sets alpha to 0 in 10 seconds
        StartCoroutine(SetAlphaToZero());


    }

    private IEnumerator SetAlphaToZero()
    {
        // start coroutine that sets alpha of GetComponent<TextMeshProUGUI> to 0 in 10 seconds
        yield return new WaitForSeconds(10f);
        GetComponent<TextMeshProUGUI>().alpha = 0;

    }


}
