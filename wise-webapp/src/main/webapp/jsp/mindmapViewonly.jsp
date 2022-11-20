<%@page pageEncoding="UTF-8" %>
<%@include file="/jsp/init.jsp" %>

<%--@elvariable id="mindmap" type="com.wisemapping.model.Mindmap"--%>

<!DOCTYPE HTML>

<html lang="${fn:substring(locale,0,2)}">
<head>
    <meta name="viewport" content="initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <base href="${requestScope['site.baseurl']}/static/mindplot/">

    <link rel="preload" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;600&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'" crossorigin>
    <link rel="preload" href="../../css/viewonly.css" as="style" onload="this.onload=null;this.rel='stylesheet'">

    <title>${mindmap.title} | <spring:message code="SITE.TITLE"/></title>
    <%@ include file="/jsp/pageHeaders.jsf" %>

    <script type="text/javascript">
          var mapId = '${mindmap.id}';
          var historyId = '${hid}';
          var userOptions = ${mindmap.properties};
          var locale = '${locale}';
          var isAuth = ${principal != null};
     </script>

    <c:if test="${requestScope['google.analytics.enabled']}">
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=${requestScope['google.analytics.account']}"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', '${requestScope['google.analytics.account']}',
          {
            'page_title' : 'Public View'
          });
        </script>
    </c:if>

    <c:if test="${requestScope['google.analytics.enabled']}">
      <!-- Google Ads Sense Config. Lazy loading optimization -->
      <script type="text/javascript">
          function downloadJsAtOnload() {
              setTimeout(function downloadJs() {
                  var element = document.createElement("script");
                  element.setAttribute("data-ad-client", "ca-pub-4996113942657337");
                  element.async = true;
                  element.src = "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js";
                  document.body.appendChild(element);
              }, 50);
          };

          window.addEventListener("load", downloadJsAtOnload, false);
      </script>
    </c:if>

	<style>
		body {
			height: 100vh;
			width: 100vw;
			min-width: 100vw;
			min-height: 100vh;
			margin: 0px;
		}

		.mindplot-root {
			height: 100%;
			width: 100%;
		}

	</style>

</head>
<body>
	<div id="root" class="mindplot-root">
        <mindplot-component id="mindmap-comp"/>
    </div>
    <div id="mindplot-tooltips" className="wise-editor"></div>

    <a href="${requestScope['site.homepage']}" target="new" aria-label="WiseMapping Homepage">
        <div id="footerLogo"></div>
    </a>

    <div id="mapDetails">
        <span class="title"><spring:message code="CREATOR"/>:</span><span>${mindmap.creator.fullName}</span>
        <span class="title"><spring:message code="DESCRIPTION"/>:</span><span>${mindmap.title}</span>
    </div>

    <script type="text/javascript" src="${requestScope['site.static.js.url']}/mindplot/loader.js" crossorigin="anonymous" defer></script>

    <div id="floating-panel">
        <div id="zoom-button">
            <button id="zoom-plus" title="<spring:message code="ZOOM_IN"/>" alt="<spring:message code="ZOOM_IN"/>">
                <img src="../../images/add.svg" width="24" height="24" alt="<spring:message code="ZOOM_IN"/>"/>
            </button>
            <button id="zoom-minus" title="<spring:message code="ZOOM_OUT"/>" alt="<spring:message code="ZOOM_OUT"/>">
                <img src="../../images/minus.svg" width="24" height="24" alt="<spring:message code="ZOOM_OUT"/>"/>
            </button>
            <div id="position">
                <button id="position-button" title="<spring:message code="ZOOM_TO_FIT"/>" alt="<spring:message code="ZOOM_TO_FIT"/>">
                    <img src="../../images/center_focus.svg" width="24" height="24" alt="<spring:message code="ZOOM_TO_FIT"/>"/>
                </button>
            </div>
        </div>
    </div>

	<script type="text/javascript">
		// Hook zoom events ...
		const zoomInButton = document.getElementById('zoom-plus');
		if (zoomInButton) {
		zoomInButton.addEventListener('click', () => {
			designer.zoomIn();
		});
		}

		const zoomOutButton = document.getElementById('zoom-minus');
		if (zoomOutButton) {
		zoomOutButton.addEventListener('click', () => {
			designer.zoomOut();
		});
		}
		
		const position = document.getElementById('position');
		if (position) {
		position.addEventListener('click', () => {
			designer.zoomToFit();
		});
		}
	</script>
</body>
</html>
