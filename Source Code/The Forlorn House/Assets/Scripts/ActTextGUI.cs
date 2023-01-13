using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ActTextGUI : MonoBehaviour
{
    public float textTime = 5f;

    float textTick;

    public TextMeshProUGUI text;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (textTick <= 0)
        {
            text.text = "";
        }
        else textTick -= 1 * Time.deltaTime;
    }

    public void ActText (string actText)
    {
        text.text = actText;
        textTick = textTime;
    }
}
