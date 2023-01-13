using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    #region Singleton
    public static Inventory instance;

    void Awake()
    {
        if(instance != null)
        {
            Debug.LogWarning("More than one instance of Inventory found");
            return;
        }
        instance = this;
    }
    #endregion

    public int space = 9;

    //public List<Item> items = new List<Item>();
    public Item[] items;

    public Item nullItem;

    public int numberOfKeys = 0;

    private void Start()
    {
        SetupEmptyInventory();
    }

    void SetupEmptyInventory()
    {
        for(int i = 0;i < 9;i ++)
        {
            items[i] = nullItem;
        }
    }

    public bool Add(Item item)
    {
        for(int i = 0;i < items.Length; i++)
        {
            if(items[i] == null || items[i].name == "Null")
            {
                items[i] = item;
                if (item.name != "Flashlight" && item.name != "Null") numberOfKeys += 1;
                return true;
            }
        }

        Debug.Log("Not Enough Space");
        return false;
    }

    public bool CheckSpace(Item item)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == null || items[i].name == "Null")
            {
                return true;
            }
        }

        Debug.Log("Not Enough Space");
        return false;
    }

    public void Remove(Item item, int index)
    {
        items[index] = nullItem;
    }
}
