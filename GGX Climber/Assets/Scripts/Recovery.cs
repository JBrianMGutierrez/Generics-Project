using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Recovery : MonoBehaviour
{
	public Animator original;
	public Transform target;
	Rigidbody rb;
	Player_Controller playerController;
	Quaternion oldRotation;
	float waitingTime = 5.0f;
	// Use this for initialization
	void Start ()
	{
		playerController = GetComponent<Player_Controller> ();
		rb = GetComponent<Rigidbody>();
	}
	
	// Update is called once per frame
	void Update ()
	{
		
	}

	public void StandUp()
	{
		StartCoroutine (Recover(waitingTime));
	}
		
	IEnumerator Recover(float waitTime)
	{
		yield return new WaitForSeconds (waitTime);
		playerController.isDead = false;
		playerController.cc.enabled = true;
		StandingUp ();
	}

	void StandingUp()
	{
		transform.localEulerAngles = new Vector3 (0, gameObject.transform.rotation.y, -90);
		rb.constraints = RigidbodyConstraints.FreezeRotation;
		original.SetBool ("Stun", false);
		original.SetBool ("recover", true);
	}
}
