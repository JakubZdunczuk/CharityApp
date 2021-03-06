<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="fragments/header.jsp" %>

<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Oddaj rzeczy, których już nie chcesz<br/>
            <span class="uppercase">potrzebującym</span>
        </h1>

        <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
                <li>
                    <div><em>1</em><span>Wybierz rzeczy</span></div>
                </li>
                <li>
                    <div><em>2</em><span>Spakuj je w worki</span></div>
                </li>
                <li>
                    <div><em>3</em><span>Wybierz fundację</span></div>
                </li>
                <li>
                    <div><em>4</em><span>Zamów kuriera</span></div>
                </li>
            </ul>
        </div>
    </div>
</div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form:form method="post" modelAttribute="donation">

            <c:forEach begin="1" end="4" varStatus="status">
                <div data-step="${status.count}" <c:if test="${status.first}">class="active"</c:if>>

                    <c:if test="${status.count==1}"><h3>Zaznacz co chcesz oddać:</h3></c:if>
                    <c:if test="${status.count==2}"><h3>Podaj liczbę 60l worków, w które spakowałeś/aś
                        rzeczy:</h3></c:if>
                    <c:if test="${status.count==3}"><h3>Wybierz organizacje, której chcesz pomóc:</h3></c:if>
                    <c:if test="${status.count==4}"><h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3></c:if>

                    <c:if test="${status.count==1}">
                        <c:forEach items="${categories}" var="category" varStatus="status2">
                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input
                                            type="checkbox"
                                            name="categories"
                                            value="${category.name}"
                                    />
                                    <span class="checkbox"></span>
                                    <span class="description">
                            <c:if test="${status2.count==1}">ubrania, które nadają się do ponownego użycia</c:if>
                            <c:if test="${status2.count==2}">ubrania, do wyrzucenia</c:if>
                            <c:if test="${status2.count==3}">zabawki</c:if>
                            <c:if test="${status2.count==4}">książki</c:if>
                            <c:if test="${status2.count==5}">inne</c:if>
                                    </span>
                                </label>
                            </div>

                        </c:forEach>
                    </c:if>
                    <c:if test="${status.count==2}">

                        <div class="form-group form-group--inline">
                            <label>
                                Liczba 60l worków:
                                <form:input type="number" path="quantity" step="1" min="1"/>
                                <form:errors path="quantity"/>
                            </label>
                        </div>

                    </c:if>

                    <c:if test="${status.count==3}">
                        <c:forEach items="${institutions}" var="institution">
                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="radio" name="organization" value="old"/>
                                    <span class="checkbox radio"></span>
                                    <span class="description">
                  <div class="title">${institution.name}</div>
                  <div class="subtitle">
                          ${institution.description}
                  </div>
                </span>
                                </label>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${status.count==4}">
                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Ulica <input type="text" name="address"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Miasto <input type="text" name="city"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Kod pocztowy <input type="text" name="postcode"/>
                                </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Numer telefonu <input type="phone" name="phone"/>
                                </label>
                            </div>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Data <input type="date" name="data"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Godzina <input type="time" name="time"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Uwagi dla kuriera
                                    <textarea name="more_info" rows="5"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <div class="form-group form-group--buttons">
                        <c:if test="${not status.first}">
                            <button type="button" class="btn prev-step">Wstecz</button>
                        </c:if>
                        <button type="button" class="btn next-step">Dalej</button>
                    </div>
                </div>
            </c:forEach>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                >4 worki ubrań w dobrym stanie dla dzieci</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                >Dla fundacji "Mam marzenie" w Warszawie</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li>Prosta 51</li>
                                <li>Warszawa</li>
                                <li>99-098</li>
                                <li>123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li>13/12/2018</li>
                                <li>15:40</li>
                                <li>Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>
<%@ include file="fragments/footer.jsp" %>