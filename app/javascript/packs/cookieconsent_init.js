$(document).on('turbolinks:load', function() {

    // obtain cookieconsent plugin
    var cc = initCookieConsent();

    // logo
    var logo = '<img src="https://fontmeme.com/permalink/220805/3b90158d204fdd325173a5c7873e7cc1.png" alt="Logo" loading="lazy" style="margin-left: -4px; margin-bottom: -5px; height: 35px">';
    var cookie = '🍪';

    // run plugin with config object
    cc.run({
        current_lang : 'en',
        autoclear_cookies : true,                   // default: false
        cookie_name: 'cc_cookie_renouveautv_africa',             // default: 'cc_cookie'
        cookie_expiration : 365,                    // default: 182
        page_scripts: true,                         // default: false

        // auto_language: null,                     // default: null; could also be 'browser' or 'document'
        // autorun: true,                           // default: true
        // delay: 0,                                // default: 0
        // force_consent: false,
        // hide_from_bots: false,                   // default: false
        // remove_cookie_tables: false              // default: false
        // cookie_domain: location.hostname,        // default: current domain
        // cookie_path: "/",                        // default: root
        // cookie_same_site: "Lax",
        // use_rfc_cookie: false,                   // default: false
        // revision: 0,                             // default: 0

        gui_options: {
            consent_modal: {
                layout: 'box',                      // box,cloud,bar
                position: 'bottom left',           // bottom,middle,top + left,right,center
                transition: 'slide'                 // zoom,slide
            },
            settings_modal: {
                layout: 'box',                      // box,bar
                // position: 'left',                // right,left (available only if bar layout selected)
                transition: 'slide'                 // zoom,slide
            }
        },

        onFirstAction: function(){
            console.log('onFirstAction fired');
        },

        onAccept: function (cookie) {
            console.log('onAccept fired ...');
        },

        onChange: function (cookie, changed_preferences) {
            console.log('onChange fired ...');
        },

        languages: {
            'en': {
                consent_modal: {
                    title: cookie + ' Nous utilisons des cookies! ',
                    //description: 'Bonjour, ce site utilise des cookies essentiels pour assurer son bon fonctionnement et des cookies de suivi pour comprendre comment vous interagissez avec lui. Ce dernier ne sera fixé qu\'après accord. <button type="button" data-cc="c-settings" class="cc-link">Laisse-moi choisir</button>',
                    description: 'Bonjour, ce site utilise des cookies essentiels pour assurer son bon fonctionnement et des cookies de suivi pour comprendre comment vous interagissez avec lui. Ce dernier ne sera fixé qu\'après accord.',
                    primary_btn: {
                        text: 'Accepter tout',
                        role: 'accept_all'              // 'accept_selected' or 'accept_all'
                    },
                    secondary_btn: {
                        text: 'Tout rejeter',
                        role: 'accept_necessary'        // 'settings' or 'accept_necessary'
                    }
                },
                settings_modal: {
                    title: logo,
                    save_settings_btn: 'Enregistrer les paramètres',
                    accept_all_btn: 'Accepter tout',
                    reject_all_btn: 'Tout rejeter',
                    close_btn_label: 'Fermer',
                    cookie_table_headers: [
                        {col1: 'Nom'},
                        {col2: 'Domaine'},
                        {col3: 'Expiration'},
                        {col4: 'Description'}
                    ],
                    blocks: [
                        {
                            title: 'Utilisation des cookies 📢',
                            description: 'Nous utilisons des cookies pour assurer les fonctionnalités de base du site Web et pour améliorer votre expérience en ligne. Vous pouvez choisir pour chaque catégorie de vous inscrire ou de vous désinscrire quand vous le souhaitez. Pour plus de détails relatifs aux cookies et autres données sensibles, veuillez lire l\'intégralité <a href="#" class="cc-link">privacy policy</a>.'
                        }, {
                            title: 'Cookies strictement nécessaires',
                            description: 'Ces cookies sont indispensables au bon fonctionnement de ce site internet. Sans ces cookies, le site Web ne fonctionnerait pas correctement',
                            toggle: {
                                value: 'necessary',
                                enabled: true,
                                readonly: true          // cookie categories with readonly=true are all treated as "necessary cookies"
                            }
                        }, {
                            title: 'Cookies de performance et d\'analyse',
                            description: 'Ces cookies permettent au site Web de se souvenir des choix que vous avez faits dans le passé',
                            toggle: {
                                value: 'analytics',     // there are no default categories => you specify them
                                enabled: true,
                                readonly: true
                            },
                            cookie_table: [
                                {
                                    col1: '^_ga',
                                    col2: 'google.com',
                                    col3: '2 ans',
                                    col4: 'description ...',
                                    is_regex: true
                                },
                                {
                                    col1: '_gid',
                                    col2: 'google.com',
                                    col3: '1 jour',
                                    col4: 'description ...',
                                }
                            ]
                        }, {
                            title: 'Cookies publicitaires et de ciblage',
                            description: 'Ces cookies collectent des informations sur la façon dont vous utilisez le site Web, les pages que vous avez visitées et les liens sur lesquels vous avez cliqué. Toutes les données sont anonymisées et ne peuvent pas être utilisées pour vous identifier',
                            toggle: {
                                value: 'targeting',
                                enabled: true,
                                readonly: true
                            }
                        }, {
                            title: 'Plus d\'information',
                            description: 'Pour toute question relative à notre politique en matière de cookies et à vos choix, veuillez <a class="cc-link" href="https://orestbida.com/contact">contactez-nous</a>.',
                        }
                    ]
                }
            }
        }

    });
});