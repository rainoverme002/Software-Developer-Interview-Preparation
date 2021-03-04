function ready(fn) {
  if (document.readyState != "loading") {
    fn();
  } else if (document.addEventListener) {
    document.addEventListener("DOMContentLoaded", fn);
  } else {
    document.attachEvent("onreadystatechange", function() {
      if (document.readyState != "loading") fn();
    });
  }
}

ready(function() {
  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  function addEventListener(el, eventName, handler) {
    if (el) {
      if (el.addEventListener) {
        el.addEventListener(eventName, handler);
      } else {
        el.attachEvent("on" + eventName, function() {
          handler.call(el);
        });
      }
    }
  }

  function forEachElement(selector, fn) {
    var elements = document.querySelectorAll(selector);
    for (var i = 0; i < elements.length; i++) fn(elements[i], i);
  }

  function addEventListeners(selector, eventName, handler) {
    forEachElement(selector, function(element) {
      addEventListener(element, eventName, handler);
    });
  }

  function hide(selector) {
    forEachElement(selector, function(el) {
      el.style.display = "none";
    });
  }

  function show(selector) {
    forEachElement(selector, function(el) {
      el.style.display = "";
    });
  }

  function remove(selector) {
    forEachElement(selector, function(el) {
      el.parentNode.removeChild(el);
    });
  }

  function html(selector, content) {
    forEachElement(selector, function(el) {
      el.innerHTML = content;
    });
  }

  function toggleClass(el, className) {
    if (el.classList) {
      el.classList.toggle(className);
    } else {
      var classes = el.className.split(" ");
      var existingIndex = -1;
      for (var i = classes.length; i--; ) {
        if (classes[i] === className) existingIndex = i;
      }

      if (existingIndex >= 0) classes.splice(existingIndex, 1);
      else classes.push(className);

      el.className = classes.join(" ");
    }
  }

  function hasClass(el, className) {
    if (el.classList) return el.classList.contains(className);
    else
      return new RegExp("(^| )" + className + "( |$)", "gi").test(el.className);
  }

  addEventListeners(".js-practicing-rails-button", "click", function(event) {
    var target = event.target;
    var label = target.getAttribute("data-button-location");
    ga("send", "event", "Practicing Rails", "Clicked Buy", label);
  });

  addEventListeners(".js-practicing-rails-sample-link", "click", function(
    event
  ) {
    ga("send", "event", "Practicing Rails", "Clicked Sample Link");
  });

  function calculateEndishOfCampaign(date) {
    date.setUTCDate(date.getUTCDate() + 20);
    date.setUTCHours(5, 0, 0);
    return date;
  }

  function timestamp(date) {
    return Math.floor(date.getTime() / 1000);
  }

  function zeropad(number) {
    if (number < 10) {
      return "0" + number;
    } else {
      return number;
    }
  }

  function pluralize(number, string, pluralString) {
    return number === 1 ? string : pluralString;
  }

  function runSale(expirationDate) {
    var duration = (expirationDate - new Date()) / 1000;
    if (duration < 0) {
      remove(".sale-box");
      show(".full-box");
    } else {
      var days = Math.floor(duration / 86400);
      duration -= days * 86400;
      var hours = Math.floor(duration / 3600);
      duration -= hours * 3600;
      var minutes = Math.floor(duration / 60);
      duration -= minutes * 60;
      var seconds = Math.floor(duration);
      var durationString =
        "" +
        days +
        " " +
        pluralize(days, "day", "days") +
        ", " +
        zeropad(hours) +
        ":" +
        zeropad(minutes) +
        ":" +
        zeropad(seconds);

      hide(".full-box");
      show(".sale-box");
      html(
        ".sale-end-date",
        "" +
          monthNames[expirationDate.getMonth()] +
          " " +
          expirationDate.getDate()
      );
      html(".sale-duration", durationString);
      setTimeout(runSale.bind(null, expirationDate), 1000);
    }
  }

  addEventListener(window, "load", function() {
    setTimeout(function() {
      addEventListeners(".ck_subscribe_form", "submit", function(event) {
        var target = event.target;
        ga("send", "event", "Subscribe Form", "Submit", target["id"].value);
      });

      forEachElement("form.ck_subscribe_form", function(element) {
        var child = document.createElement("input");
        child.setAttribute("type", "hidden");
        child.setAttribute("name", "ck_field_32793_last_optin_url");
        child.setAttribute("value", window.location.href);
        element.appendChild(child);
      });
    }, 2000);
  });

  var nav = document.getElementById("header-nav"),
    WINDOW_CHANGE_EVENT =
      "onorientationchange" in window ? "orientationchange" : "resize";

  function toggleOpen() {
    toggleClass(document.getElementById("menu"), "open");
  }

  function toggleMenu() {
    // set timeout so that the panel has a chance to roll up
    // before the menu switches states
    if (hasClass(nav, "open")) {
      setTimeout(toggleOpen, 300);
    } else {
      toggleOpen();
    }
    toggleClass(nav, "open");
    toggleClass(document.getElementById("toggle"), "x");
  }

  function closeMenu() {
    if (hasClass(nav, "open")) {
      toggleMenu();
    }
  }

  addEventListener(document.getElementById("toggle"), "click", function(e) {
    toggleMenu();
    e.preventDefault();
  });

  addEventListener(window, WINDOW_CHANGE_EVENT, closeMenu);
});
