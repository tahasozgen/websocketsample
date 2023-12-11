package tahasozgen.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import tahasozgen.websockethandler.SampleTextWebSocketHandler;

@Configuration
@EnableWebSocket
public class SampleEhoWebSocketConfigurer {
	
	@Bean
	WebSocketConfigurer webSocketConfigurer(final WebSocketHandler webSocketHandler) {
		
		return new WebSocketConfigurer() {
			@Override
			public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
				registry.addHandler(new SampleTextWebSocketHandler(), "/tahasozgen/wsAddress");
			}
		};
		
	}

	@Bean
	WebSocketHandler createSampleTextWebSocketHandler() {
		return new SampleTextWebSocketHandler();
	}
	
}