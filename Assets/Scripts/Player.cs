using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] Bloom bloomEffect;

    Rigidbody rb;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            bloomEffect.enabled = !bloomEffect.enabled;
        }

        if (Input.GetKey(KeyCode.W)) rb.AddForce(Vector3.back);
        if (Input.GetKey(KeyCode.A)) rb.AddForce(Vector3.right);
        if (Input.GetKey(KeyCode.S)) rb.AddForce(Vector3.forward);
        if (Input.GetKey(KeyCode.D)) rb.AddForce(Vector3.left);

    }
}
