CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);
INSERT INTO service_project
    (organization_id, title, description, location, project_date)
VALUES

-- BrightFuture Builders
(
    1,
    'Community Center Renovation',
    'Renovation of a local community center to improve facilities for residents.',
    'Downtown Community Center',
    '2026-11-15'
),
(
    1,
    'School Repair Project',
    'Volunteers will help repair classrooms and improve school facilities.',
    'Central Primary School',
    '2026-11-22'
),
(
    1,
    'Playground Construction',
    'Construction of a safe playground for children in the community.',
    'Unity Park',
    '2026-12-05'
),
(
    1,
    'Home Improvement Outreach',
    'Volunteers will assist vulnerable families with minor home repairs.',
    'Westside Community',
    '2026-12-12'
),
(
    1,
    'Public Library Upgrade',
    'Upgrade and repair facilities at a local public library.',
    'City Public Library',
    '2026-12-19'
),

-- GreenHarvest Growers
(
    2,
    'Community Garden Cleanup',
    'Volunteers will clean and prepare a community garden for planting.',
    'Greenfield Garden',
    '2026-11-16'
),
(
    2,
    'Urban Farming Workshop',
    'A practical workshop teaching residents basic urban farming skills.',
    'GreenHarvest Training Center',
    '2026-11-23'
),
(
    2,
    'Tree Planting Day',
    'Volunteers will plant trees to improve the local environment.',
    'Riverside Park',
    '2026-11-30'
),
(
    2,
    'Food Sustainability Outreach',
    'An educational outreach about sustainable food production.',
    'Northside Community Hall',
    '2026-12-07'
),
(
    2,
    'Neighborhood Vegetable Garden',
    'Creation of a vegetable garden to support families in the community.',
    'Hope Community',
    '2026-12-14'
),

-- UnityServe Volunteers
(
    3,
    'Food Drive',
    'Collection and distribution of food items to families in need.',
    'UnityServe Center',
    '2026-11-18'
),
(
    3,
    'Community Tutoring',
    'Volunteers will provide academic support to local students.',
    'Community Learning Center',
    '2026-11-25'
),
(
    3,
    'Elderly Support Visit',
    'Volunteers will visit and support elderly residents in the community.',
    'Sunrise Care Home',
    '2026-12-02'
),
(
    3,
    'Clothing Donation Drive',
    'Collection and distribution of clothing to people in need.',
    'Unity Community Hall',
    '2026-12-09'
),
(
    3,
    'Health Awareness Outreach',
    'Volunteers will support a community health awareness event.',
    'Central Community Square',
    '2026-12-16'
);
