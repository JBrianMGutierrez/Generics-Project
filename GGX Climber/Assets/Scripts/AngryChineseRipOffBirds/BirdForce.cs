using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BirdForce : MonoBehaviour {
	Rigidbody rb;
	public int peakForce = 1;
	// Use this for initialization
	void Start () 
	{
		rb = GetComponent<Rigidbody> ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnCollisionEnter(Collision other)
	{
		if (rb.velocity.magnitude > peakForce) {
			if (other.gameObject.tag == "Enemy") {
				Debug.Log ("I Hit " + other.gameObject.name + " " + rb.velocity.magnitude);
			}
		}
		else {
			if (other.gameObject.tag == "Enemy") {
				Debug.Log (other.gameObject.name +": Too weak! " + rb.velocity.magnitude);
			}
		}
	}
}
