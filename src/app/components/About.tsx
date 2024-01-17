import ExperienceLink from "./ExperienceLink";

export const About = () => {
  return (
    <div className="flex flex-col items-start">
      <h1 className="my-5 text-xl font-semibold text-slate-50">
        Hi, I&apos;m Peter 👋
      </h1>
      <p className="my-5 text-md text-slate-300">
        <span className="mr-1">
          I&apos;m a software engineer dedicated to crafting intuitive digital
          experiences and innovative solutions. I currently work at
        </span>
        <ExperienceLink
          href="https://foliahealth.com"
          imageSrc="/folia.png"
          imageAlt="Folia Health Logo"
        >
          Folia Health
        </ExperienceLink>
        <span>
          , where I lead efforts in building cloud infrastructure and designing
          efficient APIs while fostering team growth and enhancing
          relationships.
        </span>
      </p>
    </div>
  );
};
