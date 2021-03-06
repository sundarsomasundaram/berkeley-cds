<%@ page
	import="java.io.*, java.util.*, java.io.IOException, javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,
redis.clients.jedis.Jedis,
redis.clients.jedis.JedisShardInfo,
com.azure.identity.DefaultAzureCredentialBuilder,
com.azure.security.keyvault.secrets.SecretClient,
com.azure.security.keyvault.secrets.SecretClientBuilder,
com.azure.security.keyvault.secrets.models.KeyVaultSecret,
com.azure.security.keyvault.secrets.models.SecretProperties"%>
<html>
<head>
<title>Count visitor</title>
</head>
<body>
	<form>
		<fieldset style="width: 20%; background-color: #e6ffe6;">
			<legend>Count visitor</legend>
			<%
			boolean useSsl = true;
			//String cacheHostname = System.getenv("REDISCACHEHOSTNAME");
			//String cachekey = System.getenv("REDISCACHEKEY");

			/*
			Retrive secret from Azure keyvalut 
			SecretClient secretClient = new SecretClientBuilder().vaultUrl("https://berkeleycdsvault.vault.azure.net")
					.credential(new DefaultAzureCredentialBuilder().build()).buildClient();
			
			String cacheHostname = secretClient.getSecret("REDISCACHEHOSTNAME").getValue();
			String cacheHostname = secretClient.getSecret("REDISCACHEKEY").getValue();
			*/
			String cacheHostname = "berkeley-cds.redis.cache.windows.net";
			String cachekey = "2q5Xb3OvHTu8i0tLcAZHtVbIbidtFo9bjAzCaGWqxxw=";

			// Connect to the Azure Cache for Redis over the TLS/SSL port using the key.
			JedisShardInfo shardInfo = new JedisShardInfo(cacheHostname, 6380, useSsl);
			shardInfo.setPassword(cachekey); /* Use your access key. */
			Jedis jedis = new Jedis(shardInfo);
			String key = "visitorcnt";
			long result = jedis.incr(key);

			// Simple PING command        
			System.out.println("\nCache Command  : Ping");
			System.out.println("Cache Response : " + jedis.ping());
			jedis.close();
			%>
			<p>
				Visitor Count:
				<%=result%>.
			</p>
		</fieldset>
	</form>
</body>
</html>