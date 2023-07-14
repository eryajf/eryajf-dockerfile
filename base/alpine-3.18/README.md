平时调试时临时使用，不建议在生产当中使用此镜像。

国内地址：`registry.cn-hangzhou.aliyuncs.com/ali_eryajf/alpine:3.18`。

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: eryajf-debug
spec:
    containers:
    - name: eryajf-debug
      image: registry.cn-hangzhou.aliyuncs.com/ali_eryajf/alpine:3.18
      command: ["/bin/sh", "-c", "tail -f /dev/null"]
      env:
      - name: POD_NAME
        valueFrom:
          fieldRef:
            fieldPath: metadata.name
      - name: POD_IP
        valueFrom:
          fieldRef:
            fieldPath: status.podIP
```