using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ItemGUI : MonoBehaviour
{

    public ItemController itemC;
    public TextMeshProUGUI text;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        text.text = itemC.currentItem+1 + ". " + Inventory.instance.items[itemC.currentItem].name;
    }
}
