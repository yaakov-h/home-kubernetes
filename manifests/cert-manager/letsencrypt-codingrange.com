apiVersion: certmanager.k8s.io/v1alpha1
kind: ClusterIssuer
metadata:
  name: letsencrypt-codingrange.com
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: letsencrypt@codingrange.com
    privateKeySecretRef:
      name: letsencrypt-codingrange.com
    dns01:
      providers:
        - name: azure-dns
          azuredns:
            clientID: ac788165-9821-430d-aee6-80053b0b349a
            clientSecretSecretRef:
              name: azure-dns-principal
              key: clientSecret
            subscriptionID: adc9eef3-40a0-4f1f-9374-26dc251f852c
            tenantID: 775a5e2a-df75-4691-bb33-fe640524e5d9
            resourceGroupName: codingrange
            hostedZoneName: codingrange.com
