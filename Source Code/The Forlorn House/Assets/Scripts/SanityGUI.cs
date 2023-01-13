using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class SanityGUI : MonoBehaviour
{
    public PlayerSanity pSanity;
    public TextMeshProUGUI text;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        text.text = Mathf.Round(pSanity.sanityCurrent) + "%";
    }
}
