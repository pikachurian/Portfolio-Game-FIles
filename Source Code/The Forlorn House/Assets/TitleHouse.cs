using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TitleHouse : MonoBehaviour
{
    public GameObject goHouse;
    public GameObject goNoHouse;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(AudioManager.instance.gameCompleted == true)
        {
            goHouse.SetActive(false);
            goNoHouse.SetActive(true);
        }else
        {
            goHouse.SetActive(true);
            goNoHouse.SetActive(false);
        }
    }
}
