var _createClass = function () {function defineProperties(target, props) {for (var i = 0; i < props.length; i++) {var descriptor = props[i];descriptor.enumerable = descriptor.enumerable || false;descriptor.configurable = true;if ("value" in descriptor) descriptor.writable = true;Object.defineProperty(target, descriptor.key, descriptor);}}return function (Constructor, protoProps, staticProps) {if (protoProps) defineProperties(Constructor.prototype, protoProps);if (staticProps) defineProperties(Constructor, staticProps);return Constructor;};}();var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) {return typeof obj;} : function (obj) {return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;};function _classCallCheck(instance, Constructor) {if (!(instance instanceof Constructor)) {throw new TypeError("Cannot call a class as a function");}}
/*
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     OPTIONS:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     menuWidth: Number,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     duration: Number,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     position: String ( left, right),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     verticalAlign: String ( top, middle, bottom )
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     classBackButton: String,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     backButton: Tag html + {{backName}},
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     classActive: String,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     easing: String (easing css),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     arrow: Tag html
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 */

Element.prototype.wilHasClass = function (className) {
    var hasClass = '';
    if (this !== null) {
        hasClass = this.className.search(new RegExp(className + '(\\s|$)', 'g')) !== -1;
    }
    return hasClass;
};
Element.prototype.wilAddClass = function (className) {
    if (this !== null) {
        if (!this.wilHasClass(className)) {
            this.className += ' ' + className;
        }
    }
};
Element.prototype.wilRemoveClass = function (className) {
    if (this !== null) {
        if (this.wilHasClass(className)) {
            this.className = this.className.replace(new RegExp(' ' + className + '(\\s|$)', 'g'), '');
        }
    }
};
Element.prototype.wilStyles = function (obj) {
    for (var prop in obj) {
        this.style[prop] = obj[prop];
    }
};
function wilEach(els, cb) {
    for (var i = 0, len = els.length; i < len; i++) {
        if (i === len) break;
        cb(els[i], i);
    }
}
function wilExtend(obj, src) {
    if ((typeof src === 'undefined' ? 'undefined' : _typeof(src)) === 'object') {
        wilEach(Object.keys(src), function (key) {
            obj[key] = src[key];
        });
    }
    return obj;
}

// create wilMenuMobile
var wilMenuVertical = function () {
    function wilMenuVertical(el, opt) {_classCallCheck(this, wilMenuVertical);
        this.optDefault = {
            menuWidth: 300,
            duration: 300,
            position: 'left',
            verticalAlign: 'middle',
            classBackButton: 'nav-back-button',
            backButton: '<a href="#">Retour au {{backName}}</a>',
            classActive: 'active',
            easing: 'ease',
            arrow: '<span class="nav-arrow"></span>' };

        this.nav = el;
        this.opts = wilExtend(this.optDefault, opt);
        this.level = 0;
        this.create(document.querySelectorAll(this.nav));
    }_createClass(wilMenuVertical, [{ key: 'create', value: function create(

        els) {var _this = this;var
            opts = this.opts,nav = this.nav;

            wilEach(els, function (el) {
                _this.wrapper(el);
                _this.position(el);
                el.style.width = opts.menuWidth + 'px';
            });

            var menus = document.querySelectorAll(nav + ' .nav-menu');
            var subMenus = document.querySelectorAll(nav + ' .sub-menu');
            wilEach(menus, function (menu) {
                menu.setAttribute('data-height-default', menu.offsetHeight);
                menu.style.transition = 'all ' + opts.duration + 'ms ' + opts.easing;
                menu.parentNode.style.height = menu.offsetHeight + 'px';
            });
            wilEach(subMenus, function (subMenu) {
                _this.createBackButton(menus, subMenu, function (back, menus) {
                    _this.handleClickBack(back, menus);
                    _this.handleClickLink(back, subMenu, menus);
                });
            });
            this.menuTranslate(menus, this.level);
        } }, { key: 'wrapper', value: function wrapper(

        el) {var
            opts = this.opts;
            var innerHtml = el.innerHTML;
            el.innerHTML = '\n            <div class="nav-wrapper-outer" style="display: table; width: 100%; height: 100%">\n                <div class="nav-wrapper" style="display: table-cell; width: 100%; vertical-align: ' +

            opts.verticalAlign + '">\n                    <div class="nav-wrapper-inner" style="overflow: hidden; position: relative">\n                        ' +

            innerHtml + '\n                    </div>\n                </div>\n            </div>\n        ';




        } }, { key: 'verticalAlign', value: function verticalAlign()

        {var
            opts = this.opts;
            var y = 50;
            if (opts.verticalAlign === 'middle') y = 50;
            if (opts.verticalAlign === 'top') y = 0;
            if (opts.verticalAlign === 'bottom') y = 100;
            return y;
        } }, { key: 'menuTranslate', value: function menuTranslate(

        menus, level, height) {var _this2 = this;var
            opts = this.opts;
            wilEach(menus, function (menu) {
                menu.wilStyles({
                    top: _this2.verticalAlign() + '%',
                    transform: 'translate(-' + opts.menuWidth * level + 'px, -' + _this2.verticalAlign() + '%)',
                    width: opts.menuWidth + 'px' });

                menu.parentNode.wilStyles({
                    width: opts.menuWidth * (level + 1) + 'px',
                    height: '80vh' });

                setTimeout(function () {return menu.parentNode.style.height = height;}, opts.duration);
            });
        } }, { key: 'position', value: function position(

        el) {var
            opts = this.opts;
            if (opts.position === 'left') {
                el.wilStyles({
                    left: 0,
                    right: 'auto' });

            } else if (opts.position === 'right') {
                el.wilStyles({
                    right: 0,
                    left: 'auto' });

            }
        } }, { key: 'createBackButton', value: function createBackButton(

        menus, subMenu, cb) {var
            nav = this.nav,opts = this.opts;
            var firstList = subMenu.children[0];
            var back = document.createElement('LI');
            back.wilAddClass(opts.classBackButton);
            back.innerHTML = opts.backButton;
            subMenu.insertBefore(
            back,
            firstList);

            cb(back, menus);
        } }, { key: 'handleClickLink', value: function handleClickLink(

        back, subMenu, menus) {var _this3 = this;var
            nav = this.nav,opts = this.opts;
            var menuHasSubMenu = subMenu.previousElementSibling;
            subMenu.wilStyles({
                visibility: 'hidden',
                top: this.verticalAlign() + '%',
                transform: 'translate(100%, -' + this.verticalAlign() + '%)' });

            menuHasSubMenu.innerHTML = menuHasSubMenu.innerHTML + opts.arrow;
            menuHasSubMenu.addEventListener('click', function (event) {
                event.preventDefault();
                var subMenuHeight = event.currentTarget.nextElementSibling.offsetHeight;
                _this3.level++;
                _this3.menuTranslate(menus, _this3.level, subMenuHeight + 'px');
                event.currentTarget.parentNode.wilAddClass(opts.classActive);
                subMenu.style.visibility = 'visible';var

                backButton = opts.backButton;
                if (backButton.indexOf('{{backName}}') !== -1) {
                    backButton = backButton.replace(/{{backName}}/g, event.currentTarget.innerText);
                }
                back.innerHTML = backButton;
            });
        } }, { key: 'handleClickBack', value: function handleClickBack(

        back, menus) {var _this4 = this;var
            opts = this.opts;
            var subMenu = back.parentNode;
            back.addEventListener('click', function (event) {
                event.preventDefault();
                _this4.level--;
                var ul = back.parentNode.parentNode.parentNode;
                var parentHeight = ul.offsetHeight;
                if (ul.getAttribute('data-height-default') !== null) {
                    parentHeight = Number(ul.getAttribute('data-height-default'));
                }
                _this4.menuTranslate(menus, _this4.level, parentHeight + 'px');
                back.parentNode.parentNode.wilRemoveClass(opts.classActive);
                setTimeout(function () {return subMenu.style.visibility = 'hidden';}, opts.duration);
            });
        } }]);return wilMenuVertical;}();



/*
                                              AUTHOR: LONG NGUYEN
                                          
                                              OPTIONS:
                                              menuWidth: Number,
                                              duration: Number,
                                              position: String ( left, right),
                                              verticalAlign: String ( top, middle, bottom )
                                              classBackButton: String,
                                              backButton: Tag html + {{backName}},
                                              classActive: String,
                                              easing: String (easing css),
                                              arrow: Tag html
                                          */
var menu = new wilMenuVertical('.nav-mobile', {
    menuWidth: 300,
    duration: 250,
    verticalAlign: 'middle',
    arrow: '<span class="nav-arrow"></span>',
    backButton: '<a href="#">&lt; Retour au {{backName}}</a>',
    classBackButton: 'nav-back-button' });

$(document).ready(function() {
    $('#example').DataTable();
} );