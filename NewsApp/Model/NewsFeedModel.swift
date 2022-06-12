//
//  NewsFeedModel.swift
//  NewsApp
//
//  Created by Suraj Kumar Mandal on 12/06/22.
//

import Foundation

// MARK: - NewsFeedModel
struct NewsFeedModel: Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Results]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
}

// MARK: NewsFeedModel convenience initializers and mutators

extension NewsFeedModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NewsFeedModel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        status : String?? = nil,
        copyright : String?? = nil,
        num_results : Int?? = nil,
        results : [Results]?? = nil
    ) -> NewsFeedModel {
        return NewsFeedModel(
            status: status ?? self.status,
            copyright: copyright ?? self.copyright,
            num_results: num_results ?? self.num_results,
            results: results ?? self.results
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Results
struct Results: Codable {
    let uri : String?
    let url : String?
    let id : Int?
    let asset_id : Int?
    let source : String?
    let published_date : String?
    let updated : String?
    let section : String?
    let subsection : String?
    let nytdsection : String?
    let adx_keywords : String?
    let column : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let des_facet : [String]?
    let org_facet : [String]?
    let per_facet : [String]?
    let geo_facet : [String]?
    let media : [Media]?
    let eta_id : Int?
    
    enum CodingKeys: String, CodingKey {
        case uri = "uri"
        case url = "url"
        case id = "id"
        case asset_id = "asset_id"
        case source = "source"
        case published_date = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case des_facet = "des_facet"
        case org_facet = "org_facet"
        case per_facet = "per_facet"
        case geo_facet = "geo_facet"
        case media = "media"
        case eta_id = "eta_id"
    }
}

// MARK: Results convenience initializers and mutators

extension Results {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Results.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        uri : String?? = nil,
        url : String?? = nil,
        id : Int?? = nil,
        asset_id : Int?? = nil,
        source : String?? = nil,
        published_date : String?? = nil,
        updated : String?? = nil,
        section : String?? = nil,
        subsection : String?? = nil,
        nytdsection : String?? = nil,
        adx_keywords : String?? = nil,
        column : String?? = nil,
        byline : String?? = nil,
        type : String?? = nil,
        title : String?? = nil,
        abstract : String?? = nil,
        des_facet : [String]?? = nil,
        org_facet : [String]?? = nil,
        per_facet : [String]?? = nil,
        geo_facet : [String]?? = nil,
        media : [Media]?? = nil,
        eta_id : Int?
    ) -> Results {
        return Results(
            uri: uri ?? self.uri,
            url: url ?? self.url,
            id: id ?? self.id,
            asset_id: asset_id ?? self.asset_id,
            source: source ?? self.source,
            published_date: published_date ?? self.published_date,
            updated: updated ?? self.updated,
            section: section ?? self.section,
            subsection: subsection ?? self.subsection,
            nytdsection: nytdsection ?? self.nytdsection,
            adx_keywords: adx_keywords ?? self.adx_keywords,
            column: column ?? self.column,
            byline: byline ?? self.byline,
            type: type ?? self.type,
            title: title ?? self.title,
            abstract: abstract ?? self.abstract,
            des_facet: des_facet ?? self.des_facet,
            org_facet: org_facet ?? self.org_facet,
            per_facet: per_facet ?? self.per_facet,
            geo_facet: geo_facet ?? self.geo_facet,
            media: media ?? self.media,
            eta_id: eta_id ?? self.eta_id
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Media
struct Media: Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetadata : [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: Media convenience initializers and mutators

extension Media {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Media.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        type: String?? = nil,
        subtype: String?? = nil,
        caption: String?? = nil,
        copyright: String?? = nil,
        approved_for_syndication: Int?? = nil,
        mediaMetadata: [MediaMetadata]?? = nil
    ) -> Media {
        return Media(
            type: type ?? self.type,
            subtype: subtype ?? self.subtype,
            caption: caption ?? self.caption,
            copyright: copyright ?? self.copyright,
            approved_for_syndication: approved_for_syndication ?? self.approved_for_syndication,
            mediaMetadata: mediaMetadata ?? self.mediaMetadata
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}

// MARK: MediaMetadata convenience initializers and mutators

extension MediaMetadata {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MediaMetadata.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        url: String?? = nil,
        format: String?? = nil,
        height: Int?? = nil,
        width: Int?? = nil
    ) -> MediaMetadata {
        return MediaMetadata(
            url: url ?? self.url,
            format: format ?? self.format,
            height: height ?? self.height,
            width: width ?? self.width
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
