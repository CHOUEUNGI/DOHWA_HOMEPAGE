package kr.co.dohwa.aop;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 로킹 대상 메소드를 표시한다.
 *
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Logging {
	
	/**
	 * 목록조회, 등록, 수정 등을 행위를 로깅한다.
	 * 
	 * @return 행위
	 */
	String action() default "";
	
	/**
	 * 로깅된 메뉴의 이름을 표기한다.
	 * 
	 * @return 메뉴명
	 */
	String menuNm() default "";

}