using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotations : MonoBehaviour
{
    public float rotationSpeed = 50;

    public float delta = 1.5f;  // Amount to move left and right from the start point
    public float speed = 2.0f;
    private Vector3 startPos;
    // Use this for initialization
    void Start ()
    {
        startPos = transform.position;
    }
	
	// Update is called once per frame
	void Update () {
        if(gameObject.name == "Metal_Bar_South")
        {
            transform.Rotate(0, 0, 50 * rotationSpeed);
        }

        if (gameObject.name == "Metal_Bar")
        {
            Vector3 v = startPos;
            v.z += delta * Mathf.Sin(Time.time * speed);
            transform.position = v;
        }

    }
}
