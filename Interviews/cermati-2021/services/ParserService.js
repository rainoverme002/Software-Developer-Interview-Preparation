const cheerio = require('cheerio');
const ParserHelper = require('../helpers/ParserHelper')

const parseIndexPage = function (content) {
    const $ = cheerio.load(content);
    const articles = $('.list-of-articles').children('.article-list-item');
    const hrefChilds = articles.children('a');

    let articleUrls = hrefChilds.map(function () {
        return $(this).attr('href')
    }).get()

    return articleUrls
}

const parseArticlePage = function (content) {
    const results = {};
    const $ = cheerio.load(content);

    results['title'] = ParserHelper.sanitizeHTML($('.post-title').text());
    results['author'] = ParserHelper.sanitizeHTML($('.author-name').text());
    results['postingDate'] = ParserHelper.sanitizeHTML($('.post-date').children('span').text());
    results['relatedArticles'] = parseSideList(content, 'Artikel Terkait');

    return results
};

const parseSideList = function (content, panelHeader) {
    const $ = cheerio.load(content);
    const sideListHeader = $('.panel-header');

    const sideListChilds = sideListHeader.filter(function () {
        return $(this).text().trim() === panelHeader;
    }).next()

    const hrefChilds = sideListChilds.children('li').children('a')
    const titleChilds = hrefChilds.children('.item-title')

    let relatedArticles = hrefChilds.map(function () {
        return {
            'url': process.env.BASE_URL + $(this).attr('href'),
            'title': ParserHelper.sanitizeHTML(($(this).children('h5').text()))
        }

    }).get()

    return relatedArticles
};

module.exports = {
    parseIndexPage,
    parseArticlePage
};