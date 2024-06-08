//
//  DataModel.swift
//  Poetry Core
//
//  Created by Afnan Ahmed on 27/12/2023.
//

import Foundation
import UIKit

struct PoemsData {
    var title: String
    var name: String
    var firstname: String
    var lastname: String
    var like: Bool
    var discription: String
    
    init(title: String, name: String, firstname: String, lastname: String, like: Bool, discription: String) {
        self.title = title
        self.name = name
        self.firstname = firstname
        self.lastname = lastname
        self.like = like
        self.discription = discription
    }
}


var appPoems: [PoemsData] = [
    
    
    
    
    PoemsData(title: "Love", name: "Eternal Tango", firstname: "Adrian", lastname: "Heartsong", like: false, discription: "In moonlit steps, a dance unfolds, Two hearts entwined, a story told. Eternal tango, passion bold, Love's embrace, a warmth to hold."),
    PoemsData(title: "Love", name: "Whispers of the Heart", firstname: "Sophia", lastname: "Moonlight", like: false, discription: "Silent whispers in the still of night, Love's language, soft and light. Hearts entangled, a timeless flight, In the echo of love, everything's right."),
    PoemsData(title: "Love", name: "Fading Sunset", firstname: "Gabriel", lastname: "Horizon", like: false, discription: "As the sun sets on our shared horizon, Love deepens, a connection unbroken. In the fading sunset, a promise spoken, Forever entwined, our souls align."),
    PoemsData(title: "Love", name: "Tides of Affection", firstname: "Isabella", lastname: "Shore", like: false, discription: "Love, a tide that ebbs and flows, A dance of passion, a feeling that grows. Tides of affection, as emotion shows, In the heart's ocean, love eternally glows."),
    PoemsData(title: "Love", name: "The Art of Apology", firstname: "Alexander", lastname: "Canvas", like: false, discription: "In the canvas of The art of apology, a tale to unfold, In healed hearts, love takes hold."),
    
    PoemsData(title: "Happy", name: "Mirror's Tale", firstname: "Miriam", lastname: "Reflections", like: false, discription: "Mirror reflects a journey of years, Lines of wisdom, etched in tears. In the mirror's tale, conquering fears, Reflections of resilience, triumph appears."),
    PoemsData(title: "Happy", name: "Soul's Solitude", firstname: "Samuel", lastname: "Silence", like: false, discription: "In the quiet chamber of the soul, Echoes of solitude take their toll. Yet, in the silence, self is whole, Introspection's balm, making one whole."),
    PoemsData(title: "Happy", name: "Footprints in the Sands of Time", firstname: "Timeless", lastname: "Legacy", like: false, discription: "Time's relentless waves wash the shore, Footprints left, then seen no more. In the sands of time, a story to explore, Legacy lingers, forevermore."),
    PoemsData(title: "Happy", name: "The Echo Within", firstname: "Echo", lastname: "Chamber", like: false, discription: "Words unspoken, echo within, A silent dialogue, where thoughts begin. In the echo chamber of the mind's din, Introspection's journey, a path to spin."),
    PoemsData(title: "Happy", name: "Meditation of Moonlight", firstname: "Luna", lastname: "Insight", like: false, discription: "Beneath the moon's soft meditation, Contemplation blooms, a silent sensation. In the meditation of moonlight, a revelation, The soul's journey, an inner exploration."),

    PoemsData(title: "Nature", name: "Morning's Embrace", firstname: "Emily", lastname: "Rivers", like: false, discription: "The sun arises, a gentle caress,Painting the sky in hues of red. Nature awakens, whispers confess, Morning's embrace, a world widespread."),
    PoemsData(title: "Nature", name: "Winter's Lullaby", firstname: "Jasper", lastname: "Frost", like: false, discription: "Snowflakes dance in the pale moonlight, Blanketing earth in a quilt so white. Whispers of winter in the silent night, Lullabies of snow, a tranquil sight."),
    PoemsData(title: "Nature", name: "In the Garden of Spring", firstname: "Lily", lastname: "Meadows", like: false, discription: "Blossoms bloom, a riot of hues, Awakening life, banishing blues. Spring's tender touch, a gift to choose, In the garden, dreams anew infuse."),
    PoemsData(title: "Nature", name: "Autumn's Palette", firstname: "Oliver", lastname: "Amber", like: false, discription: "Leaves of gold, crimson, and rust, Falling softly, a gentle thrust.Autumn's palette, a masterpiece thrust, Nature's canvas, an artist's trust."),
    PoemsData(title: "Nature", name: "A Symphony of Rain", firstname: "Serena", lastname: "Sky", like: false, discription: "Raindrops compose a melody rare, Tapping on rooftops, a rhythmic affair. A symphony of rain, a liquid prayer, Nature's music, soothing the air."),
    
    PoemsData(title: "Justice", name: "Voices of the Unheard", firstname: "Harper", lastname: "Justice", like: false, discription: "In shadows cast by society's gaze, Voices of the unheard weave their maze. In the tapestry of injustice, a fiery blaze, Change whispers in rebellious phrase."),
    PoemsData(title: "Justice", name: "March of Equality", firstname: "Emilia", lastname: "Freedom", like: false, discription: "Footsteps echo in a march of pride, Equality's banner held high and wide. In the march of justice, none denied, Hope blossoms, prejudice set aside."),
    PoemsData(title: "Justice", name: "Silent Witnesses", firstname: "Witnessing", lastname: "Souls", like: false, discription: "Witnesses to oppression, silent cries, Injustice hidden behind society's lies. Silent witnesses, where conscience ties, In their stories, justice never dies."),
    PoemsData(title: "Justice", name: "Rising Phoenix", firstname: "Phoenix", lastname: "Flame", like: false, discription: "From the ashes of discrimination's pyre, A rising phoenix, justice to inspire. In the flames of courage, a relentless fire, Equality's anthem, a rallying choir."),
    PoemsData(title: "Justice", name: "Harmony of Humanity", firstname: "Unity", lastname: "Melody", like: false, discription: "In the harmony of humanity's diverse song, Acceptance and understanding belong. United against prejudice, standing strong, Injustice defeated, tolerance prolong."),
    PoemsData(title: "Sad", name: "Dreamscape", firstname: "Dreamweaver", lastname: "", like: false, discription: "In the realm of dreams, reality bends, A dreamscape where imagination ascends. In the tapestry of sleep, creation amends, Where fantasy and reality blend."),
    
    PoemsData(title: "Sad", name: "Whispers of the Muse", firstname: "Muse", lastname: "Whisperer", like: false, discription: "The muse whispers in creative ears, Inspiration's song, calming fears. In the symphony of ideas, the muse appears, Guiding the hand through creative spheres."),
    PoemsData(title: "Sad", name: "Labyrinth of Thoughts", firstname: "Mind", lastname: "Explorer", like: false, discription: "A labyrinth of thoughts, winding and wide, Exploration of the mind, where ideas abide. In the labyrinth's corridors, creativity's guide, Imagination's journey, an endless tide."),
    PoemsData(title: "Sad", name: "Stars in the Mind's Sky", firstname: "Stella", lastname: "Thoughts", like: false, discription: "Ideas, like stars in the mind's night, A constellation of thoughts burning bright. In the vastness of imagination's height, Creativity sparkles, a celestial light."),
    PoemsData(title: "Sad", name: "The Quantum of Wonder", firstname: "Quantum", lastname: "Wonderer", like: false, discription: "In the quantum of wonder, thoughts unfold, A universe of ideas, vast and untold. In the wonder of the mind's stories, bold, Imagination's tapestry, a spectacle to behold."),


]

var data = [PoemsData]()

var type = "all"
var poets = ""
