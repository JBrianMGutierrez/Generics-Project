using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Grab : MonoBehaviour {

	public float force = 4000;
	BoxCollider bc;
    SpringJoint sp;
    public bool grabbed = false;
    // Use this for initialization
    void Start ()
    {
		bc = GetComponent<BoxCollider> ();
	}
	
	// Update is called once per frame
	void Update ()
    {
		if (grabbed && Input.GetMouseButtonDown (0)) {
			Destroy (sp);
			Debug.Log ("I Release");
			grabbed = false;
			bc.isTrigger = false;
		}
    }

    void OnCollisionStay(Collision col)
	{
		if (!grabbed && Input.GetKeyUp (KeyCode.F))
        {
            Debug.Log("I Grabbed");
            sp = gameObject.AddComponent<SpringJoint> ();
			sp.connectedBody = col.rigidbody;
			bc.isTrigger = true;
			sp.spring = 25000;
			sp.breakForce = force;
			grabbed = true;
		}
    }

	void OnJointBreak ()
	{
		grabbed = false;
		bc.isTrigger = false;
	}
}
