using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player_Controller : MonoBehaviour {
	
	Rigidbody rb;
	[HideInInspector] public bool isDead = false;
	[HideInInspector] public bool isGrounded = false;

    public float rotationSpeed;
	public float resistance = 10;
	public float jumpHeight = 5;
	public float forwardSpeed = 5;
	public float backwardSpeed = 10;
    public float amount = 30f;

	// Use this for initialization
	void Start ()
	{
        rb = GetComponent<Rigidbody>();
	}

	// Update is called once per frame
	void Update () 
	{
		if (!isDead)
		{
			if (Input.GetButtonDown("Jump") && isGrounded)
			{
				Jump();
			}
			if (Input.GetKey(KeyCode.W))
			{
				rb.AddForce(new Vector3(transform.forward.x, 0, transform.forward.z) * forwardSpeed);
			}
			if (Input.GetKey (KeyCode.S))
			{
				//rb.AddForce(new Vector3(-transform.forward.x, 0, -transform.forward.z) * backwardSpeed);
                rb.AddForce(-rb.velocity * backwardSpeed);
            }

		}
    }

    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.D))
        {

            transform.Rotate(new Vector3(-rotationSpeed, 0, 0));
        }
        if (Input.GetKey(KeyCode.A))
        {
            transform.Rotate(new Vector3(rotationSpeed, 0, 0));
        }
    }

    void OnCollisionEnter(Collision col)
	{
		isGrounded = true;
	}

	void Jump()
	{
        if(!isDead)
        {
            rb.AddForce(new Vector3(0, jumpHeight * 100, 0), ForceMode.Impulse);
            isGrounded = false;
        }
	}
}
