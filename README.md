# Overview
 Este é um estudo básico do funcionamento do nginx. Através dele é possível criar um servidor que oferece uma página principal e uma página de erro, assim como duas páginas secundárias, chamadas de serviços 1 e 2, além de um LoadBalancer que distribui a carga entre os dois servidores que hospedam as páginas "serviço".

 # How to

 Para subir a infraestrutura necessária utilizamos o Docker, para inicializar os containeres basta executar o script "container-up.sh" na raiz.

 ```bash
sh container-up.sh
```

Com os containeres já em execução, basta testar seu funcionamento no navegador.

Página principal: http://localhost:80
Erro: http://localhost:80/qualquercoisa
Svc 1: http://localhost:8001 ou http://localhost:80/servico1
Svc 2: http://localhost:8002 ou http://localhost:80/servico2
LoadBalancer: http://localhost:8003  (Atualizar a página para observar a requisição sendo alteranada entre svc 1 e 2).