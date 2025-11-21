<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="contents">
	<div class="section-cont">
		<h3 class="title-sect">신용평가등급</h3>
		<div class="table-box credit-rating-table-wrap">
			<div class="credit-rating-box clfix">
				<div class="credit-rating-txt">
					<span class="year">2022</span>
					<sapn class="grade">A2+</sapn>
					<span class="txt">NICE신용평가㈜(D~A1)</span>
				</div>
				<div class="credit-rating-txt">
					<span class="year">2024</span>
					<sapn class="grade">AA+</sapn>
					<span class="txt">㈜나이스디앤비(AAA~NG)</span>
				</div>
			</div>
			<div class="table-wrap-type01">
				<em class="table-scroll-hint active"></em>
				<table class="table-col-type01 border-top-style02">
					<caption>
						<span class="txt01">감사위원회 활동 내역</span>
						<span class="txt02">:평가일</span>
						<span class="txt03">,평가대상 증권등</span>
						<span class="txt04">,평가대상증권의 신용등급</span>
						<span class="txt04">,평가회사(신용평가등급범위)</span>
						<span class="txt04">,평가구분</span>
					</caption>
					<colgroup>
						<col style="width:21.5vw" />
						<col style="width:33.8vw" />
						<col style="width:45vw" />
						<col style="width:47vw" />
						<col style="width:25vw" />
					</colgroup>
					<thead>
						<tr>
							<th>평가일</th>
							<th>평가대상 증권등</th>
							<th>평가대상증권의 신용등급</th>
							<th>평가회사(신용평가등급범위)</th>
							<th>평가구분</th>
						</tr>
					</thead>
					<tbody>
						<tr>						
							<td>2024.03</td>	
							<td>기업신용등급</td>	
							<td><span class="color-point">AA+</span></td>	
							<td>(주)나이스디앤비(AAA~NG)</td>	
							<td>공공기관 제출용</td>
						</tr>
						<tr>						
							<td>2023.03</td>	
							<td>기업신용등급</td>	
							<td><span class="color-point">AA+</span></td>	
							<td>(주)나이스디앤비(AAA~NG)</td>	
							<td>공공기관 제출용</td>
						</tr>
						<tr>
							<td>2022.12</td>	
							<td>기업어음</td>	
							<td><span class="color-point">A2+</span></td>	
							<td>NICE신용평가(주)(D~A1)</td>	
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2022.06</td>	
							<td>기업어음</td>	
							<td><span class="color-point">A2+</span></td>	
							<td>NICE신용평가(주)(D~A1)</td>	
							<td>본평가</td>
						</tr>
						<tr>
							<td>2022.04</td>	
							<td>기업신용등급</td>	
							<td><span class="color-point">AA+</span></td>	
							<td>(주)나이스디앤비(AAA~NG)</td>	
							<td>공공기관 제출용</td>
						</tr>
						<tr>
							<td>2021.12</td>	
							<td>기업어음</td>	
							<td><span class="color-point">A2+</span></td>	
							<td>NICE신용평가(주)(D~A1)</td>	
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2021.06</td>	
							<td>기업어음</td>	
							<td><span class="color-point">A2+</span></td>	
							<td>NICE신용평가(주)(D~A1)</td>	
							<td>본평가</td>
						</tr>
						<tr>
							<td>2021.04</td>
							<td>기업신용등급</td>
							<td><span class="color-point">AA+</span></td>
							<td>(주)나이스디앤비(AAA~NG)</td>	
							<td>공공기관 제출용</td>
						</tr>						
						<tr>
							<td>2020.12</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2020.06</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>본평가</td>
						</tr>
						<tr>
							<td>2020.04</td>
							<td>기업신용등급</td>
							<td><span class="color-point">AA+</span></td>
							<td>㈜나이스디앤비(AAA~NG)</td>
							<td>공공기관 제출용</td>
						</tr>
						<tr>
							<td>2019.12</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2019.06</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>본평가</td>
						</tr>
						<tr>
							<td>2019.04</td>
							<td>기업신용등급</td>
							<td><span class="color-point">AA+</span></td>
							<td>㈜나이스디앤비(AAA~NG)</td>
							<td>공공기관 제출용</td>
						</tr>
						<tr>
							<td>2018.12</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2018.06</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>본평가</td>
						</tr>
						<tr>
							<td>2018.04</td>
							<td>기업신용등급</td>
							<td><span class="color-point">AA+</span></td>
							<td>㈜나이스디앤비(AAA~NG)</td>
							<td>공공기관 제출용</td>
						</tr>
						<tr>
							<td>2017.12</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>정기평가</td>
						</tr>
						<tr>
							<td>2017.06</td>
							<td>기업어음</td>
							<td><span class="color-point">A2+</span></td>
							<td>NICE신용평가㈜(D~A1)</td>
							<td>본평가</td>
						</tr>
						<tr>
							<td>2017.04</td>
							<td>기업신용등급</td>
							<td><span class="color-point">AA+</span></td>
							<td>㈜나이스디앤비(AAA~NG)</td>
							<td>공공기관 제출용</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="section-cont">
		<h3 class="title-sect">신용평가등급 정의</h3>
		<div class="table-wrap-type01">
			<table class="table-col-type01">
				<caption>
					<span class="txt01">신용평가기관</span>
					<span class="txt02">등급</span>
					<span class="txt03">정의</span>
				</caption>
				<colgroup>
					<col style="width:27.3vw" />
					<col style="width:21.6vw" />
					<col style="width:73vw" />
				</colgroup>
				<thead>
					<tr>
						<th>신용평가기관</th>
						<th>등급</th>
						<th>정의</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="6">NICE신용평가</td>
						<td><span class="color-point">A1</span></td>
						<td class="left sp02">
							적기상환능력이 최고수준으로 투자위험도가
							<br />
							극히 낮으며, 현 단계에서 합리적으로 예측
							<br />
							가능한 장래의 어떠한 환경변화에도 영향을
							<br />
							받지 않을 만큼 안정적임.
						</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">A2</span></td>
						<td class="left sp02">
							적기상환능력이 우수하며 투자위험도가 매우
							<br />
							낮지만 A1등급에 비해 다소 열등한 요소가 있음.
						</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">A3</span></td>
						<td class="left sp02">
							적기상환능력이 양호하며, 투자위험도는 낮은
							<br />
							수준이지만 장래 급격한 환경변화에 따라 다소
							<br />
							영향을 받을 가능성이 있음.
						</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">B</span></td>
						<td class="left sp02">
							적기상환능력은 인정되지만 투기적 요소가
							<br />
							내재되어 있음.
						</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">C</span></td>
						<td class="left sp02">적기상환능력이 의문시됨.</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">D</span></td>
						<td class="left">지급불능 상태에 있음.</td>
					</tr>
					<tr>
						<td rowspan="11">㈜나이스디앤비</td>
						<td>
							<span class="color-point">
								e-1
								<br />
								(AAA)
							</span>
						</td>
						<td class="left sp02">
							최상위의 상거래 신뢰도를 보유하며, 합리적으로
							<br />
							예측 가능한 어떠한 환경변화에도 대처가능한
							<br />
							초우량의 신용수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-2
								<br />
								(AA)
							</span>
						</td>
						<td class="left sp02">
							양호한 상거래 신뢰도를 보유하며, 예측 가능한
							<br />
							환경변화에 대한 대처능력이 상당한 수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-3
								<br />
								(A)
							</span>
						</td>
						<td class="left sp02">
							우위의 상거래 신뢰도가 인정되지만, 예측 가능한
							<br />
							환경변화에 대한 대처능력이 제한적인 수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-4
								<br />
								(BBB)
							</span>
						</td>
						<td class="left sp02">적정 수준의 상거래 신뢰도를 보유하지만, 장래 거래안정성에 다소 부정적인 요인이 내재되어 있는 수준</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-5
								<br />
								(BB)
							</span>
						</td>
						<td class="left sp02">비교적 무난한 수준의 상거래 신뢰도를 보유하지만, 장래 거래안정성에 다소 부정적인 요인이 내재되어 있는 수준</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-6
								<br />
								(B)
							</span>
						</td>
						<td class="left sp02">
							단기적인 상거래 신뢰도는 인정되지만,
							<br />
							향후 환경변화에 따라 거래 안정성이 저하될 가능성이 있는 수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-7
								<br />
								(CCC)
							</span>
						</td>
						<td class="left sp02">
							현재 수준에서 상거래 신뢰도가 제한적이며, 장래
							<br />
							거래 안정성 저하 가능성이 예상 되어 주의가
							<br />
							요망되는 수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-8
								<br />
								(CC)
							</span>
						</td>
						<td class="left sp02">
							채무불이행 발생 가능성을 내포하고 있으며, 상위
							<br />
							등급에 비해 거래안정성이 매우 낮은 수준
						</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-9
								<br />
								(C)
							</span>
						</td>
						<td class="left sp02">채무불이행 발생 가능성이 높아 향후 회복가능성이 낮고 적기상환능력이 의심되는 수준으로 현금거래가 요망</td>
					</tr>
					<tr>
						<td class="line-left">
							<span class="color-point">
								e-10
								<br />
								(D)
							</span>
						</td>
						<td class="left sp02">
							지급불능 상태의 매우 취약한 신용능력을
							<br />
							나타내어 적기 상환능력이 전무한 수준
						</td>
					</tr>
					<tr>
						<td class="line-left"><span class="color-point">NG</span></td>
						<td class="left sp02">등급부재 : 신용평가 불응, 자료 불충분, 폐(휴)업 등의 사유로 판단보류</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>